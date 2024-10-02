class InhouseLoansController < ApplicationController
  before_action :set_inhouse_loan, only: %i[ show edit update destroy ]

  # GET /inhouse_loans or /inhouse_loans.json
  def index
    @inhouse_loans = InhouseLoan.all
  end

  # GET /inhouse_loans/1 or /inhouse_loans/1.json
  def show
  end

  # GET /inhouse_loans/new
  def new
    @inhouse_loan = InhouseLoan.new
    @parcels = Parcel.where(status: 'Available').order(:block).collect{ |u| ["#{u.subdivision.short_code} Block #{u.block} - Lot #{u.lot}", u.id]}
  end

  # GET /inhouse_loans/1/edit
  def edit
  end

  # POST /inhouse_loans or /inhouse_loans.json
  def create
    @inhouse_loan = InhouseLoan.new(inhouse_loan_params)

    respond_to do |format|
      if @inhouse_loan.save
        
        comp_balance = @inhouse_loan.contract_price.to_f - (@inhouse_loan.processing_fees.to_f + @inhouse_loan.downpayment.to_f)

        monthly_amort = FinanceMath::Loan.new(nominal_rate: @inhouse_loan.interest.to_i, duration: @inhouse_loan.terms.to_i, amount: comp_balance.to_f).pmt
        @inhouse_loan.update(balance: comp_balance, monthly_amort: monthly_amort)

        terms = @inhouse_loan.terms.to_i
        contract_price = @inhouse_loan.contract_price.to_i
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
          
          line_item = InhouseLoanItem.create!(loan_id: @inhouse_loan.id, term: term, principal: t_principal.to_f, interest: t_interest.to_f, monthly_amort: monthly_amort.to_f, balance: t_balance.to_f, duedate: t_period, is_paid: false)
          
          tmp_bal = t_balance
          term += 1
        end
        InhouseLoanItem.where(loan_id: @inhouse_loan.id).last.destroy!

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


  def compute_equity_monthly_amort
    dp = params['downpayment']
    reservation_fee = params['reservation_fee']
    terms = params['terms']
    monthly_amort = (dp.to_f - reservation_fee.to_f) / terms.to_f
    monthly_amort = sprintf "%.2f", monthly_amort
    render json: monthly_amort
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
