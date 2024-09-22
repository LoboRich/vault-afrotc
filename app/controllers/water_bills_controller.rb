class WaterBillsController < ApplicationController
  before_action :set_water_bill, only: %i[ show edit update destroy pay process_pay]
  include WaterBillsHelper
  require 'rubyXL'
  # GET /water_bills or /water_bills.json
  def index
    @water_bills = WaterBill.all

    @water_bills = WaterBill.all
    @paid_waters = WaterBill.paid
    @unpaid_waters = WaterBill.unpaid
  end

  # GET /water_bills/1 or /water_bills/1.json
  def show
    @paid_waters = WaterBill.paid
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
    consumed = @water_bill.current - @water_bill.previous
    respond_to do |format|
      if @water_bill.save
        History.create(user_id: current_user.id, description: "Creates a new water bill", model: "WaterBill", model_id: @water_bill.id)
        @water_bill.update!(consume: consumed, amount: check_amount_per_cubic(consumed), due_date: @water_bill.reading_date + 10.days, grace_period: @water_bill.reading_date + 20.days, )
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
      original_attributes = @water_bill.attributes.slice(*water_bill_params.keys)
      if @water_bill.update(water_bill_params)

        updated_fields_with_values = water_bill_params.keys.each_with_object({}) do |key, result|
          new_value = @water_bill.send(key)
          if new_value != original_attributes[key.to_s]
            result[key] = new_value
          end
        end

        History.create(user_id: current_user.id, description: "#{updated_fields_with_values.inspect}", model: "WaterBill", model_id: @water_bill.id)

        format.html { redirect_to water_bill_url(@water_bill), notice: "Water bill was successfully updated." }
        format.json { render :show, status: :ok, location: @water_bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @water_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def download_excel
    @water_bills = WaterBill.all || []
    @unpaid_water_bills = WaterBill.where(status: 'unpaid') || []

    workbook = RubyXL::Workbook.new
    worksheet = workbook.worksheets[0]
    worksheet.sheet_name = 'All Records'

    # Header for All Waters Table
    current_month = Date.today.strftime("%B %Y") # e.g., "September 2024"
    worksheet.add_cell(0, 0, "Unpaid Water Bills - #{current_month}")
    worksheet.add_cell(1, 0, 'Name')
    worksheet.add_cell(1, 1, 'Project')
    worksheet.add_cell(1, 2, 'Block')
    worksheet.add_cell(1, 3, 'Lot')
    worksheet.add_cell(1, 4, 'Amount Due')
    worksheet.add_cell(1, 5, 'Remarks')

    # Data for All Waters Table
    @unpaid_water_bills.each_with_index do |water, index|
      worksheet.add_cell(index + 2, 0, water.client.name)
      worksheet.add_cell(index + 2, 3, water.loan_parcels)
      worksheet.add_cell(index + 2, 4, water.amount)
      worksheet.add_cell(index + 2, 5, water.remarks)
    end

    # Adding a new worksheet for Paid Waters
    worksheet = workbook.add_worksheet('Paid Records')
    worksheet.add_cell(0, 0, 'ID')
    worksheet.add_cell(0, 1, 'Status')
    worksheet.add_cell(0, 2, 'Details')

    # Data for Paid Waters Table
    @unpaid_water_bills.each_with_index do |water, index|
      worksheet.add_cell(index + 1, 0, water.id)
      worksheet.add_cell(index + 1, 1, water.status)
    end

    # Send the file to the user
    send_data workbook.stream.read, filename: 'all_unpaid_data.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  end

  # DELETE /water_bills/1 or /water_bills/1.json
  def destroy
    water_bill_details = @water_bill.attributes.slice(*@water_bill.class.column_names)
    @water_bill.destroy!

    History.create(user_id: current_user.id, description: "Deleted Water Bill: #{water_bill_details.inspect}")

    respond_to do |format|
      format.html { redirect_to water_bills_url, notice: "Water bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pay

  end

  def paid
    @paid_waters = WaterBill.paid
  end

  def process_pay
    @water_bill.update!(status: 'paid', bank_name: params[:customer_payments][:bank_name], mode_of_payment: params[:customer_payments][:mode_of_payment], receipt: params[:customer_payments][:receipt],  payment_date: params[:customer_payments][:payment_date], remarks: params[:customer_payments][:remarks], received_by: "#{current_user.name} #{current_user.surname}")

    History.create(user_id: current_user.id, description: "Payments made to water bill: #{@water_bill.id}" , model: "WaterBill", model_id: @water_bill.id)
    redirect_to water_bills_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_bill
      @water_bill = WaterBill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def water_bill_params
      params.require(:water_bill).permit(:client_id, :loan_id, :previous, :current, :consume, :amount, :or_number, :due_date, :reading_date, :grace_period, :status, :remarks, :penalty, :total, :mode_of_payment, :receipt, :reference_number, :bank_name, :payment_date, :received_by)
    end
end
