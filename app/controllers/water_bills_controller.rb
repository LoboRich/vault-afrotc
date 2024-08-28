class WaterBillsController < ApplicationController
  before_action :set_water_bill, only: %i[ show edit update destroy ]
  include WaterBillsHelper
  # GET /water_bills or /water_bills.json
  def index
    @water_bills = WaterBill.all
  end

  # GET /water_bills/1 or /water_bills/1.json
  def show
  end

  # GET /water_bills/new
  def new
    @water_bill = WaterBill.new
    
    @loans = Loan.all.map do |loan|
      parcel_details = loan.parcels.map do |parcel|
        "Block #{parcel.block} Lot #{parcel.lot}"
      end.join(', ')
      [parcel_details, loan.id]
    end
  end

  # GET /water_bills/1/edit
  def edit
  end

  # POST /water_bills or /water_bills.json
  def create
    @water_bill = WaterBill.new(water_bill_params)
    @client = Loan.find(water_bill_params[:loan_id]).client
    @water_bill.client_id = @client.id
    respond_to do |format|
      if @water_bill.save
        @water_bill.update!(amount: @water_bill.current - @water_bill.previous, consume: check_amount_per_cubic(@water_bill.current - @water_bill.previous), due_date: @water_bill.reading_date + 10.days, grace_period: @water_bill.reading_date + 20.days, )

        format.html { redirect_to water_bill_url(@water_bill), notice: "Water bill was successfully created." }
        format.json { render :show, status: :created, location: @water_bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @water_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_bills/1 or /water_bills/1.json
  def update
    respond_to do |format|
      if @water_bill.update(water_bill_params)
        format.html { redirect_to water_bill_url(@water_bill), notice: "Water bill was successfully updated." }
        format.json { render :show, status: :ok, location: @water_bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @water_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_bills/1 or /water_bills/1.json
  def destroy
    @water_bill.destroy!

    respond_to do |format|
      format.html { redirect_to water_bills_url, notice: "Water bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_bill
      @water_bill = WaterBill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def water_bill_params
      params.require(:water_bill).permit(:client_id, :loan_id, :previous, :current, :consume, :amount, :or_number, :due_date, :reading_date, :grace_period, :status, :remarks, :penalty, :total, :mode_of_payment, :receipt, :reference_number)
    end
end
