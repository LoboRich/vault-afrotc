class InhouseLoanItemsController < ApplicationController
  before_action :set_inhouse_loan_item, only: %i[ show edit update destroy ]

  # GET /inhouse_loan_items or /inhouse_loan_items.json
  def index
    @inhouse_loan_items = InhouseLoanItem.all
  end

  # GET /inhouse_loan_items/1 or /inhouse_loan_items/1.json
  def show
  end

  # GET /inhouse_loan_items/new
  def new
    @inhouse_loan_item = InhouseLoanItem.new
  end

  # GET /inhouse_loan_items/1/edit
  def edit
  end

  # POST /inhouse_loan_items or /inhouse_loan_items.json
  def create
    @inhouse_loan_item = InhouseLoanItem.new(inhouse_loan_item_params)

    respond_to do |format|
      if @inhouse_loan_item.save
        format.html { redirect_to @inhouse_loan_item, notice: "Inhouse loan item was successfully created." }
        format.json { render :show, status: :created, location: @inhouse_loan_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inhouse_loan_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inhouse_loan_items/1 or /inhouse_loan_items/1.json
  def update
    respond_to do |format|
      if @inhouse_loan_item.update(inhouse_loan_item_params)
        format.html { redirect_to @inhouse_loan_item, notice: "Inhouse loan item was successfully updated." }
        format.json { render :show, status: :ok, location: @inhouse_loan_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inhouse_loan_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inhouse_loan_items/1 or /inhouse_loan_items/1.json
  def destroy
    @inhouse_loan_item.destroy!

    respond_to do |format|
      format.html { redirect_to inhouse_loan_items_path, status: :see_other, notice: "Inhouse loan item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inhouse_loan_item
      @inhouse_loan_item = InhouseLoanItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inhouse_loan_item_params
      params.require(:inhouse_loan_item).permit(:term, :inhouse_loan_id, :due_date, :principal, :interest, :monthly_amort, :balance, :is_paid, :penalty, :advance, :payment_date, :or, :paid_amount, :receipt_img)
    end
end
