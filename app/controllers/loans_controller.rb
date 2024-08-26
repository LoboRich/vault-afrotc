class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]

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
        parcels = @loan.blocklot.reject(&:empty?)
        parcels.each do |p|
          LoanParcel.create(parcel_id: p, loan_id: @loan.id)
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
          
          line_item = LoanItem.create!(loan_id: @loan.id, term: term, principal: t_principal.to_f, interest: t_interest.to_f, monthly_amort: monthly_amort.to_f, balance: t_balance.to_f, period: t_period, is_paid: true)
          
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
    @loan.destroy!

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params 
      params.require(:loan).permit(:client_id, {:blocklot => []}, :terms, :model_house, :loan_financing, :contract_price, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :loan_start_date, :balance, :remarks, :status, :broker)
    end
end
