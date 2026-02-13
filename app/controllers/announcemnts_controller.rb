class AnnouncemntsController < ApplicationController
  before_action :set_announcemnt, only: %i[ show edit update destroy ]

  # GET /announcemnts or /announcemnts.json
  def index
    @announcemnts = Announcemnt.all
  end

  # GET /announcemnts/1 or /announcemnts/1.json
  def show
  end

  # GET /announcemnts/new
  def new
    @announcemnt = Announcemnt.new
  end

  # GET /announcemnts/1/edit
  def edit
  end

  # POST /announcemnts or /announcemnts.json
  def create
    @announcemnt = Announcemnt.new(announcemnt_params)

    respond_to do |format|
      if @announcemnt.save
        sms_response = SmsSender.send_sms(
          # recipient: @reservist.phone_number,
          recipient: "09164745123",
          message: "URGENT: Family trapped at Barangay Banago. Water rising fast. Need boat/rescue team immediately. Map Link: #{@announcemnt.google_maps_link}"
        )

        if sms_response[:error]
          flash[:alert] = "SMS failed: #{sms_response[:error]}"
        else
          flash[:notice] = "SMS sent successfully!"
        end
        format.html { redirect_to @announcemnt, notice: "Announcemnt was successfully created." }
        format.json { render :show, status: :created, location: @announcemnt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcemnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcemnts/1 or /announcemnts/1.json
  def update
    respond_to do |format|
      if @announcemnt.update(announcemnt_params)
        format.html { redirect_to @announcemnt, notice: "Announcemnt was successfully updated." }
        format.json { render :show, status: :ok, location: @announcemnt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @announcemnt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcemnts/1 or /announcemnts/1.json
  def destroy
    @announcemnt.destroy!

    respond_to do |format|
      format.html { redirect_to announcemnts_path, status: :see_other, notice: "Announcemnt was successfully destroyed." }
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
        longitude: r.longitude
      }
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcemnt
      @announcemnt = Announcemnt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcemnt_params
      params.require(:announcemnt).permit(:name, :description, :location, :latitude, :longitude, :atype, :query)
    end
end
