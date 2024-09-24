class ParcelsController < ApplicationController
  before_action :set_parcel, only: %i[ show edit update destroy new_purchaser ]

  # GET /parcels or /parcels.json
  def index
    @parcels = Parcel.all
  end

  # GET /parcels/1 or /parcels/1.json
  def show
    @purchasers = Purchaser.where(parcel_id: @parcel.id)
  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
  end

  # GET /parcels/1/edit
  def edit
  end

  # POST /parcels or /parcels.json
  def create
    @parcel = Parcel.new(parcel_params)

    respond_to do |format|
      if @parcel.save
        format.html { redirect_to parcel_url(@parcel), notice: "Parcel was successfully created." }
        format.json { render :show, status: :created, location: @parcel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcels/1 or /parcels/1.json
  def update
    respond_to do |format|
      if @parcel.update(parcel_params)
        format.html { redirect_to parcel_url(@parcel), notice: "Parcel was successfully updated." }
        format.json { render :show, status: :ok, location: @parcel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcels/1 or /parcels/1.json
  def destroy
    @parcel.destroy!

    respond_to do |format|
      format.html { redirect_to parcels_url, notice: "Parcel was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  def new_purchaser
    @purchaser = Purchaser.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcel
      @parcel = Parcel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parcel_params
      params.require(:parcel).permit(:block, :lot, :status, :subdivision_id, :lot_area, :house_area, :description, :selling_price, :model)
    end
end
