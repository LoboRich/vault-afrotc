class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
    @attachments = @vehicle.attachments
    fresh_when etag: @vehicle
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @classifications = Vehicle.classifications
    @makes = Vehicle.makes
  end

  # GET /vehicles/1/edit
  def edit
    @classifications = Vehicle.classifications
    @makes = Vehicle.makes
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params.except(:attachments))
    @vehicle.save!
    store_photos

    respond_to do |format|
      format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
      format.json { render :show, status: :created }
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    @vehicle.update!(vehicle_params.except(:attachments))
    delete_photos
    store_photos

    respond_to do |format|
      format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
      format.json { render :show }
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
      params.require(:vehicle).permit(
        :classification,
        :registered_owner,
        :bus_num,
        :mv_file,
        :plate_num,
        :ending_num,
        :body_type,
        :motor_num,
        :chassis_num,
        :seat_capacity,
        :make,
        :year_model,
        :fuel,
        :num_of_cyclinder,
        :field_office,
        :cr_num,
        :cr_date_issue,
        :or_field_office,
        :or_num,
        :or_date_issue,
        :reg_amount,
        :body_color,
        :coc_date_coverage,
        :coc_num,
        :coc_amount,
        :insurance_name,
        :status,
        :date_operate,
        :date_retired,
        :remarks,
        :quality_type,
        :penalties_surcharge,
        :cr_field_office,
        :type_of_vehicle,
        :route_per_operation,
        :year_rebuild,
        :authorize_route_id,
        :franchise_id,
        { attachments: [] },
        :is_registered
      )      
    end

    def store_photos
      attachments = params[:vehicle][:attachments].reject(&:blank?)
    
      attachments.each do |file|
        Attachment.create!(
          vehicle_id: @vehicle.id,
          image: file,
          filename: "#{File.basename(file.original_filename, '.*')} #{Date.current}.#{File.extname(file.original_filename).delete('.')}"
        )
      end if attachments.present?
    end
    

    def delete_photos
      if @vehicle.attachments.count > 0
        @vehicle.attachments.each do |x|
          x.destroy if params[x.id.to_s] == "delete"
        end
      end
    end
end
