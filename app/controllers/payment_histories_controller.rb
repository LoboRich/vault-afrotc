class PaymentHistoriesController < ApplicationController
  before_action :set_payment_history, only: %i[ show edit update destroy ]

  # GET /payment_histories or /payment_histories.json
  def index
    @payment_histories = PaymentHistory.all
  end

  # GET /payment_histories/1 or /payment_histories/1.json
  def show
  end

  # GET /payment_histories/new
  def new
    @payment_history = PaymentHistory.new
  end

  # GET /payment_histories/1/edit
  def edit
  end

  # POST /payment_histories or /payment_histories.json
  def create
    @payment_history = PaymentHistory.new(payment_history_params)

    respond_to do |format|
      if @payment_history.save
        format.html { redirect_to payment_history_url(@payment_history), notice: "Payment history was successfully created." }
        format.json { render :show, status: :created, location: @payment_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_histories/1 or /payment_histories/1.json
  def update
    respond_to do |format|
      if @payment_history.update(payment_history_params)
        format.html { redirect_to payment_history_url(@payment_history), notice: "Payment history was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_histories/1 or /payment_histories/1.json
  def destroy
    @payment_history.destroy!

    respond_to do |format|
      format.html { redirect_to payment_histories_url, notice: "Payment history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_history
      @payment_history = PaymentHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_history_params
      params.require(:payment_history).permit(:loan_id, :current_balance, :interest, :payment, :new_balance, :mode_of_payment, :check_bank, :check_no, :bank_name, :bank_account_no, :ar_account_no, :penalty, :processing, :reservation, :equity, :others, :advance_payment_to_principal, :principal, :downpayment, :processing_fee, :payment_date, :or_num, :memo, :running_balance, :is_deposited, :deposited_date, :deposited_memo, :deposited_bank_account, :receipt)
    end
end
