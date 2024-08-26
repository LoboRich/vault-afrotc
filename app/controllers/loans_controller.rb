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
    binding.pry
    # @loan = Loan.new(loan_params)

    # respond_to do |format|
    #   if @loan.save
    #     format.html { redirect_to loan_url(@loan), notice: "Loan was successfully created." }
    #     format.json { render :show, status: :created, location: @loan }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @loan.errors, status: :unprocessable_entity }
    #   end
    # end
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
      params.require(:loan).permit(:client_id, {:blocklot => []}, :terms, :model_house, :loan_financing, :contract_price, :processing_fees, :downpayment, :interest, :principal, :monthly_amort, :contract_date, :amortization_start_date, :balance, :remarks, :status, :broker)
    end
end
