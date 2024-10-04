class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy pay process_pay]

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
    @has_loan = @loan.inhouse_loan.present? ? true : false
  end
  # GET /loans/new
  def new
    @loan = Loan.new
    @parcels = Parcel.where(status: 'Available').order(:block).collect{ |u| ["#{u.subdivision.short_code} Block #{u.block} - Lot #{u.lot}", u.id]}
  end

  def check_parcel_price
    if params[:id].present?
      parcels = Parcel.find(params[:id])
      render json: parcels.pluck(:selling_price).sum
    else
      render json: 0
    end
  end


  # GET /loans/1/edit
  def edit
    @parcels = Parcel.where(status: 'Available').order(:block).collect{ |u| ["#{u.subdivision.short_code} Block #{u.block} - Lot #{u.lot}", u.id]}
  end

  # POST /loans or /loans.json
  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save

        # save loan parcels(Blk&Lot)
        parcels = JSON.parse(@loan.blocklot).reject(&:empty?)
        parcels.each do |p|
          parcel = LoanParcel.create(parcel_id: p, loan_id: @loan.id)
          Parcel.find(p).update(status: 'Reserved')
        end

        
        downpayment_percentage =  @loan.downpayment.to_f - @loan.reservation_fee.to_f
        balance =  @loan.contract_price.to_f - (@loan.downpayment.to_f)
        monthly_amort =  (@loan.downpayment.to_f - @loan.reservation_fee.to_f) / @loan.terms.to_i
        @loan.update(balance: balance, downpayment_percentage: downpayment_percentage, monthly_amort: monthly_amort)

        terms = @loan.terms.to_i

        term = 1
        tmp_bal = downpayment_percentage

        while term <= terms && tmp_bal >= 0
          t_principal = monthly_amort.to_f
          t_balance = tmp_bal - t_principal

          # Calculate the due date based on the current term
          period = @loan.amortization_start_date + term.months - 1.months
          t_period = period.strftime("%b-%d-%Y").to_date

          # Create the LoanItem with the calculated values
          line_item = LoanItem.create!(
            loan_id: @loan.id,
            term: term,
            principal: t_principal,
            monthly_amort: monthly_amort.to_f,
            balance: t_balance,
            duedate: t_period,
            is_paid: false
          )
          
          tmp_bal = t_balance
          term += 1
        end

        History.create(user_id: current_user.id, description: "Creates a new loan equity", model: "Loan", model_id: @loan.id)
        format.html { redirect_to loan_url(@loan), notice: "Loan was successfully created." }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    respond_to do |format|
      original_attributes = @loan.attributes.slice(*loan_params.keys)
      if @loan.update(loan_params)

        updated_fields_with_values = loan_params.keys.each_with_object({}) do |key, result|
          new_value = @loan.send(key)
          if new_value != original_attributes[key.to_s]
            result[key] = {original_attributes[key.to_s] => new_value}
          end
        end

        History.create(user_id: current_user.id, description: "Updated Loan: #{updated_fields_with_values.inspect}", model: "Loan", model_id: @loan.id)
        format.html { redirect_to loan_url(@loan), notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    loan_details = @loan.attributes.slice(*@loan.class.column_names)
    
    @loan.loan_parcels.each do |p|
      Parcel.find(p.parcel_id).update(status: 'Available')
    end
    
    @loan.destroy

    History.create(user_id: current_user.id, description: "Deleted Loan: #{loan_details.inspect}")
    respond_to do |format|
      format.html { redirect_to loans_url, notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def compute_monthly_amort
    interest_rate = params['interest_rate']
    terms = params['terms']
    balance = params['balance']
    monthly_amort = FinanceMath::Loan.new(nominal_rate: interest_rate, duration: terms, amount: balance).pmt
    monthly_amort = sprintf "%.2f", monthly_amort
    render json: monthly_amort
  end

  def pay
    @loanItem = @loan.loan_items.order("duedate asc").where(is_paid: false).first
  end
  def process_pay
    params.permit!
    customer = @loan
    unless params['customer_payments']['payment'] == "0" 
      next_line = customer.loan_items.order("duedate asc").where(is_paid: false).first
      to_pay_monthly_amort = next_line.monthly_amort
      next_term = next_line.term
      next_period = next_line.duedate

      customer.loan_items.where(is_paid: false).destroy_all 
      prev_balance = customer.downpayment_percentage
      
      payment_params = params["customer_payments"]["payment"].to_f 

      principal = customer.monthly_amort
      
      penalty = params["customer_payments"]["penalty"].to_f
      advance_payment = payment_params > to_pay_monthly_amort ? payment_params - to_pay_monthly_amort : 0
      balance = prev_balance - payment_params + penalty
      monthly_amort = principal

      customer.update!(downpayment_percentage: balance) 
      
      @paid_amort = LoanItem.create!(loan_id: customer.id, term: next_term, principal: principal, monthly_amort: to_pay_monthly_amort.to_f, balance: balance.to_f, duedate: next_period, or: params["customer_payments"]["or_num"], paid_amount: payment_params, payment_date: params["customer_payments"]["payment_date"], penalty: penalty, advance: advance_payment, is_paid: true)
      
      term = next_term + 1
      duedate = next_period + 1.months
      tmp_bal = customer.downpayment_percentage
      while term <= @loan.terms.to_i && tmp_bal >= 0
       
        t_principal = customer.monthly_amort.to_f
        t_balance = tmp_bal - t_principal.to_f

        t_period = duedate

        if tmp_bal > 1
          line_item = LoanItem.create!(loan_id: customer.id, term: term, principal: t_principal.to_f, monthly_amort: customer.monthly_amort.to_f, balance: t_balance.to_f, duedate: t_period, is_paid: false)
        end

        tmp_bal = t_balance
        term += 1
        duedate = t_period + 1.months
      end
    end

    History.create(user_id: current_user.id, description: "Payments made to loan: #{@loan.id}" , model: "Loan", model_id: @loan.id)
    payment_history = PaymentHistory.create(
      loan_id: customer.id,
      loan_item_id: @paid_amort.id,
      current_balance: prev_balance,
      principal: principal,
      payment: payment_params,
      new_balance: balance,
      mode_of_payment:  params["customer_payments"]["mode_of_payment"],
      check_bank: params["customer_payments"]["check_bank"],
      check_no: params["customer_payments"]["check_no"],
      bank_name: params["customer_payments"]["bank_name"],
      penalty: params["customer_payments"]["penalty"],
      others: params["customer_payments"]["others"],
      # downpayment: params["customer_payments"]["downpayment"],
      or_num: params["customer_payments"]["or_num"],
      payment_date: params["customer_payments"]["payment_date"],
      memo: params["customer_payments"]["memo"],
      # running_balance: running_balance,
    )

    redirect_to customer
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params 
      params.require(:loan).permit(:reservation_fee, :downpayment_percentage, :client_id, {:blocklot => []}, :terms, :model_house, :loan_financing, :contract_price, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :amortization_start_date, :balance, :remarks, :status, :broker)
    end
end
