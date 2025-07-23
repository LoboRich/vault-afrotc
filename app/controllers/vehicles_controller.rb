class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy!

    respond_to do |format|
      format.html { redirect_to vehicles_path, status: :see_other, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:classification, :registered_owner, :bus_num, :mv_file, :plate_num, :ending_num, :body_type, :denomination, :motor_num, :chassis_num, :gross_weight, :net_capacity, :seat_capacity, :make, :year_model, :fuel, :num_of_cyclinder, :field_office, :cr_num, :cr_date_issue, :or_field_office, :or_num, :or_date_issue, :reg_amount, :body_color, :coc_date_coverage, :coc_num, :coc_amount, :insurance_name, :status, :book_value, :date_operate, :date_retired, :remarks, :coi_date_coverage, :quality_type, :coi_num, :coi_amount, :piston_displacement, :category, :bus_series, :present_holder, :penalties_surcharge, :cr_field_office, :type_of_vehicle, :route_per_operation, :year_rebuild, :authorize_route_id, :franchise_id)
    end
end
