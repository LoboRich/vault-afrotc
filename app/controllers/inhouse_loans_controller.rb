class InhouseLoansController < ApplicationController
  before_action :set_inhouse_loan, only: %i[ show edit update destroy pay process_pay ]

  # GET /inhouse_loans or /inhouse_loans.json
  def index
    @inhouse_loans = InhouseLoan.all
  end

  # GET /inhouse_loans/1 or /inhouse_loans/1.json
  def show
  end

  # GET /inhouse_loans/new
  def new
    @loan_id = params[:loan]
    @loan = Loan.find(@loan_id)
    if @loan.nil?
      flash[:alert] = "Equity not found."
      redirect_to(request.referer)
    else
      @inhouse_loan = InhouseLoan.new
    end
  end

  # GET /inhouse_loans/1/edit
  def edit
  end

  # POST /inhouse_loans or /inhouse_loans.json
  def create
    @loan = Loan.find(params[:inhouse_loan][:loan_id])

    if @loan.nil?
      flash[:alert] = "Loan not found."
      redirect_to new_inhouse_loan_path
      return
    end

    @inhouse_loan = InhouseLoan.new(inhouse_loan_params)
    @inhouse_loan.client_id = @loan.client_id

    respond_to do |format|
      if @inhouse_loan.save
        
        comp_balance = @inhouse_loan.balance.to_f - @inhouse_loan.processing_fees.to_f

        monthly_amort = FinanceMath::Loan.new(nominal_rate: @inhouse_loan.interest.to_i, duration: @inhouse_loan.terms.to_i, amount: comp_balance.to_f).pmt
        @inhouse_loan.update(balance: comp_balance, monthly_amort: monthly_amort)

        terms = @inhouse_loan.terms.to_i
        contract_price = @loan.contract_price.to_i
        processing_fees = @inhouse_loan.processing_fees.to_i
        downpayment = @inhouse_loan.downpayment.to_f
        interest_rate = @inhouse_loan.interest.to_i
        balance =  @inhouse_loan.balance.to_f
        interest = balance * (interest_rate.to_f/12) / 100

        term = 1
        tmp_bal = balance
        while tmp_bal >= 0
          t_interest = tmp_bal * (@inhouse_loan.interest.to_f/12) / 100
          t_principal = monthly_amort.to_f - t_interest.to_f
          t_balance = tmp_bal - t_principal.to_f

          period = @inhouse_loan.amortization_start_date + term.months - 1.months
          t_period = period.strftime("%b-%d-%Y").to_date
          
          line_item = InhouseLoanItem.create!(inhouse_loan_id: @inhouse_loan.id, term: term, principal: t_principal.to_f, interest: t_interest.to_f, monthly_amort: monthly_amort.to_f, balance: t_balance.to_f, due_date: t_period, is_paid: false)
          
          tmp_bal = t_balance
          term += 1
        end
        # InhouseLoanItem.where(inhouse_loan_id: @inhouse_loan.id).last.destroy!

        History.create(user_id: current_user.id, description: "Creates a new Inhouse loan", model: "InhouseLoan", model_id: @inhouse_loan.id)
        format.html { redirect_to @inhouse_loan, notice: "Inhouse loan was successfully created." }
        format.json { render :show, status: :created, location: @inhouse_loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inhouse_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inhouse_loans/1 or /inhouse_loans/1.json
  def update
    original_attributes = @inhouse_loan.attributes.slice(*loan_params.keys)
    respond_to do |format|
      if @inhouse_loan.update(inhouse_loan_params)
        updated_fields_with_values = loan_params.keys.each_with_object({}) do |key, result|
          new_value = @inhouse_loan.send(key)
          if new_value != original_attributes[key.to_s]
            result[key] = {original_attributes[key.to_s] => new_value}
          end
        end

        History.create(user_id: current_user.id, description: "Updated Inhouse Loan: #{updated_fields_with_values.inspect}", model: "InhouseLoan", model_id: @inhouse_loan.id)
        format.html { redirect_to @inhouse_loan, notice: "Inhouse loan was successfully updated." }
        format.json { render :show, status: :ok, location: @inhouse_loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inhouse_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inhouse_loans/1 or /inhouse_loans/1.json
  def destroy
    loan_details = @inhouse_loan.attributes.slice(*@inhouse_loan.class.column_names)
    @inhouse_loan.inhouse_loan_items.destroy_all
    
    @inhouse_loan.destroy!

    History.create(user_id: current_user.id, description: "Deleted Inhouse Loan: #{loan_details.inspect}")
    respond_to do |format|
      format.html { redirect_to inhouse_loans_path, status: :see_other, notice: "Inhouse loan was successfully destroyed." }
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


  def compute_equity_monthly_amort
    dp = params['downpayment']
    reservation_fee = params['reservation_fee']
    terms = params['terms']
    monthly_amort = (dp.to_f - reservation_fee.to_f) / terms.to_f
    monthly_amort = sprintf "%.2f", monthly_amort
    render json: monthly_amort
  end

  def pay
    @inhouseLoanItem = @inhouse_loan.inhouse_loan_items.order("due_date asc").where(is_paid: false).first
  end
  def process_pay
    params.permit!
    customer = @inhouse_loan
    unless params['customer_payments']['payment'] == "0" 
      next_line = customer.inhouse_loan_items.order("due_date asc").where(is_paid: false).first
      to_pay_monthly_amort = next_line.monthly_amort
      next_term = next_line.term
      next_period = next_line.due_date

      customer.inhouse_loan_items.where(is_paid: false).destroy_all 
      prev_balance = customer.balance
      payment_params = params["customer_payments"]["payment"].to_f 

      interest = prev_balance * (customer.interest.to_f/12)/100
      principal = customer.monthly_amort - interest
      advance_payment = payment_params > to_pay_monthly_amort ? payment_params - to_pay_monthly_amort : 0
      penalty = params["customer_payments"]["penalty"].to_f
      balance = prev_balance - payment_params + interest + penalty
      monthly_amort = principal + interest

      customer.update!(balance: balance)
      
      @paid_amort = InhouseLoanItem.create!(inhouse_loan_id: customer.id, term: next_term, principal: principal, interest: interest.to_f, monthly_amort: to_pay_monthly_amort.to_f, balance: balance.to_f, due_date: next_period, penalty: penalty, advance: advance_payment, or: params["customer_payments"]["or_num"], paid_amount: payment_params + penalty, payment_date: params["customer_payments"]["payment_date"], is_paid: true)
      
      term = next_term + 1
      due_date = next_period + 1.months
      tmp_bal = customer.balance
      while tmp_bal >= 0
        t_interest = tmp_bal * (customer.interest.to_f/12) / 100
        t_principal = customer.monthly_amort.to_f - t_interest.to_f
        t_balance = tmp_bal - t_principal.to_f

        InhouseLoanItem.create!(
          inhouse_loan_id: customer.id,
          term: term,
          principal: t_principal.to_f,
          interest: t_interest.to_f,
          monthly_amort: customer.monthly_amort.to_f,
          balance: t_balance.to_f,
          due_date: due_date,
          is_paid: false
        )

        tmp_bal = t_balance
        term += 1
        
        if tmp_bal < customer.monthly_amort
          InhouseLoanItem.create!(
            inhouse_loan_id: customer.id,
            term: term,
            principal: tmp_bal.to_f,
            interest: t_interest.to_f,
            monthly_amort: tmp_bal.to_f + t_interest.to_f,
            balance: 0,
            due_date: due_date + 1.months,
            is_paid: false
          )
          break
        end

        due_date += 1.months
      end
    end

    History.create(user_id: current_user.id, description: "Payments made to inhouse loan: #{@inhouse_loan.id}" , model: "InhouseLoan", model_id: @inhouse_loan.id)
  #   payment_history = PaymentHistory.create(
  #     loan_id: customer.id,
  #     loan_item_id: @paid_amort.id,
  #     current_balance: prev_balance,
  #     interest: interest, 
  #     principal: principal,
  #     payment: payment_params,
  #     new_balance: balance,
  #     mode_of_payment:  params["customer_payments"]["mode_of_payment"],
  #     check_bank: params["customer_payments"]["check_bank"],
  #     check_no: params["customer_payments"]["check_no"],
  #     bank_name: params["customer_payments"]["bank_name"],
  #     penalty: params["customer_payments"]["penalty"],
  #     others: params["customer_payments"]["others"],
  #     # downpayment: params["customer_payments"]["downpayment"],
  #     or_num: params["customer_payments"]["or_num"],
  #     payment_date: params["customer_payments"]["payment_date"],
  #     memo: params["customer_payments"]["memo"],
  #     # running_balance: running_balance,
  #     advance_payment: advance_payment
  #   )

    redirect_to customer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inhouse_loan
      @inhouse_loan = InhouseLoan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inhouse_loan_params
      params.require(:inhouse_loan).permit(:client_id, :loan_id, :terms, :loan_financing, :balance, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :amortization_start_date, :remarks, :other_expense)
    end
end
