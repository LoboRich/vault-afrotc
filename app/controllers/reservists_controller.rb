class ReservistsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_reservist, only: %i[ show edit update destroy ]
  layout "registration", only: [:new]
  # GET /reservists or /reservists.json
  def index
    @reservists = Reservist.all
  end

  # GET /reservists/1 or /reservists/1.json
  def show
  end

  # GET /reservists/new
  def new
    @reservist = Reservist.new
  end

  # GET /reservists/1/edit
  def edit
  end

  # POST /reservists or /reservists.json
  def create
    @reservist = Reservist.new(reservist_params)

    respond_to do |format|
      if @reservist.save
        format.html { redirect_to @reservist, notice: "Reservist was successfully created." }
        format.json { render :show, status: :created, location: @reservist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservists/1 or /reservists/1.json
  def update
    respond_to do |format|
      if @reservist.update(reservist_params)
        format.html { redirect_to @reservist, notice: "Reservist was successfully updated." }
        format.json { render :show, status: :ok, location: @reservist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservists/1 or /reservists/1.json
  def destroy
    @reservist.destroy!

    respond_to do |format|
      format.html { redirect_to reservists_path, status: :see_other, notice: "Reservist was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def search
    results = Geocoder.search(
      params[:query],
      params: {
        countrycodes: "ph", # Philippines only
        addressdetails: 1,
        limit: 5
      }
    )
        
    render json: results.map { |r|
      {
        label: r.display_name,
        latitude: r.latitude,
        longitude: r.longitude,
        city: r.city,
        province: r.province || r.state,
        zipcode: r.postal_code
      }
    }
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservist
      @reservist = Reservist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservist_params
      params.require(:reservist).permit(:rank, :last_name, :first_name, :middle_name, :branch_of_service, :afpsn, :primary_afsc, :duty_afsc, :other_skills, :source_of_enlistment, :soe_authority, :soe_date_of_enlistment, :soe_initial_rank, :source_of_commission, :soc_authority, :soc_date_of_enlistment, :soc_initial_rank, :reservist_classification, :classification_authority, :date_of_classification, :reserve_unit_assignment, :date_assigned, :unit_capability, :present_designation, :mobilization_center, :street_address, :city, :province, :region, :zip_code, :date_of_birth, :place_of_birth, :age, :sex, :marital_status, :religion, :ethnic_group, :blood_type, :eye_color, :hair_color, :complexion, :identifying_marks, :height_cm, :weight_kg, :email, :residence_tel, :office_tel, :mobile_nr, :tin, :sss_number, :gsis_number, :philhealth_number, :pagibig_number, :dialects_spoken, :latitude, :longitude, :lat, :long, :location, :is_active)
    end
end
