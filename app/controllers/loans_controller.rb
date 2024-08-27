class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy pay process_pay]

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
  end
  # GET /loans/new
  def new
    @loan = Loan.new
    @parcels = Parcel.where.not(status: 'taken').order(:block).collect{ |u| ["#{u.subdivision.short_code} Block #{u.block} - Lot #{u.lot}", u.id]}
  end

  # GET /loans/1/edit
  def edit
    @parcels = Parcel.where.not(status: 'taken').order(:block).collect{ |u| ["#{u.subdivision.short_code} Block #{u.block} - Lot #{u.lot}", u.id]}
  end

  # POST /loans or /loans.json
  def create
    @loan = Loan.new(loan_params)
    @loan.balance = @loan.contract_price.to_f - (@loan.processing_fees.to_f + @loan.downpayment.to_f)

    respond_to do |format|
      if @loan.save

        # save loan parcels(Blk&Lot)
        parcels = JSON.parse(@loan.blocklot).reject(&:empty?)
        parcels.each do |p|
          LoanParcel.create(parcel_id: p, loan_id: @loan.id)
          # update parcel status to reserved/taken
        end

        monthly_amort = FinanceMath::Loan.new(nominal_rate: @loan.interest.to_i, duration: @loan.terms.to_i, amount: @loan.balance.to_f).pmt
        @loan.update(balance: @loan.balance, monthly_amort: monthly_amort)

        terms = @loan.terms.to_i
        contract_price = @loan.contract_price.to_i
        processing_fees = @loan.processing_fees.to_i
        downpayment = @loan.downpayment.to_f
        interest_rate = @loan.interest.to_i
        balance =  @loan.balance.to_f
        interest = balance * (interest_rate.to_f/12) / 100

        term = 1
        tmp_bal = balance
        while tmp_bal >= 0
          t_interest = tmp_bal * (@loan.interest.to_f/12) / 100
          t_principal = monthly_amort.to_f - t_interest.to_f
          t_balance = tmp_bal - t_principal.to_f

          period = @loan.amortization_start_date + term.months - 1.months
          t_period = period.strftime("%b-%Y").to_date
          
          line_item = LoanItem.create!(loan_id: @loan.id, term: term, principal: t_principal.to_f, interest: t_interest.to_f, monthly_amort: monthly_amort.to_f, balance: t_balance.to_f, duedate: t_period, is_paid: false)
          
          tmp_bal = t_balance
          term += 1
        end
        LoanItem.where(loan_id: @loan.id).last.destroy!

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
      if @loan.update(loan_params)
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
    @loan.loan_items.destroy_all
    @loan.loan_parcels.destroy_all
    # @loan.payment_histories.destroy_all
    @loan.destroy

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
      next_line = customer.loan_items.where(is_paid: false).first
      next_term = next_line.term
      next_period = next_line.duedate

      customer.loan_items.where(is_paid: false).destroy_all 
      customer_balance = customer.balance
      interest = customer.balance * (customer.interest.to_f/12)/100
      principal = params["customer_payments"]["payment"].to_f - interest
      balance = customer.balance - principal
      monthly_amort = principal + interest
      customer.update!(balance: balance)
      
      AmortizationLineItem.create!(amortization_id: customer.id, term: next_term, principal: principal, interest: interest.to_f, monthly_amort: monthly_amort.to_f, balance: balance.to_f, duedate: next_period, is_paid: true)
      
      term = next_term + 1
      duedate = next_period + 1.months
      tmp_bal = customer.balance
      while tmp_bal >= 0
        t_interest = tmp_bal * (customer.interest.to_f/12) / 100
        t_principal = customer.monthly_amort.to_f - t_interest.to_f
        t_balance = tmp_bal - t_principal.to_f

        t_period = duedate
        
        if t_balance < customer.monthly_amort
          tmp_amort = AmortizationLineItem.create!(amortization_id: customer.id, term: term, principal: t_principal.to_f, interest: t_interest.to_f, monthly_amort: customer.monthly_amort.to_f, balance: t_balance.to_f, duedate: t_period, is_paid: false)
          tmp_amort = AmortizationLineItem.create!(amortization_id: customer.id, term: term, principal: t_balance.to_f, interest: t_interest.to_f, monthly_amort: t_balance.to_f + t_interest.to_f, balance: 0, duedate: t_period, is_paid: false)
          break
        else
          tmp_amort = AmortizationLineItem.create!(amortization_id: customer.id, term: term, principal: t_principal.to_f, interest: t_interest.to_f, monthly_amort: customer.monthly_amort.to_f, balance: t_balance.to_f, duedate: t_period, is_paid: false)
        end

        tmp_bal = t_balance
        term += 1
        duedate = t_period + 1.months
      end
    end #ends check for if not paying payments

    histories = @loan.payment_histories
    sum = 0
    sum += histories.sum(:penalty)
    sum += histories.sum(:downpayment)
    sum += histories.sum(:processing_fee)
    sum += histories.sum(:principal)

    if histories.count == 0
      running_balance = customer.contract_price
    else
      running_balance = customer.contract_price-sum
    end

    payment_history = PaymentHistory.create(
      amortization_id: customer.id, 
      current_balance: customer_balance,
      interest: interest, 
      principal: principal,
      payment: params["customer_payments"]["payment"],
      new_balance: balance,
      mode_of_payment:  params["customer_payments"]["mode_of_payment"],
      check_bank: params["customer_payments"]["check_bank"],
      check_no: params["customer_payments"]["check_no"],
      bank_account_id: params["customer_payments"]["bank_account_id"],
      ar_account_id: customer.ar_account_id,
      penalty: params["customer_payments"]["penalty"],
      processing: params["customer_payments"]["processing"],
      reservation: params["customer_payments"]["reservation"],
      others: params["customer_payments"]["others"],
      equity: params["customer_payments"]["equity"],
      advance_payment_to_principal: params["customer_payments"]["advance_payment_to_principal"],
      downpayment: params["customer_payments"]["downpayment"],
      processing_fee: params["customer_payments"]["processing_fee"],
      or_num: params["customer_payments"]["or_num"],
      payment_date: params["customer_payments"]["payment_date"],
      memo: params["customer_payments"]["memo"],
      running_balance: running_balance
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
      params.require(:loan).permit(:client_id, {:blocklot => []}, :terms, :model_house, :loan_financing, :contract_price, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :amortization_start_date, :balance, :remarks, :status, :broker)
    end
end
