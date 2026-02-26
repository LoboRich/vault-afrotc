class AdtsController < ApplicationController
  before_action :set_adt, only: %i[ show edit update destroy ]

  # GET /adts or /adts.json
  def index
    @adts = Adt.all
  end

  # GET /adts/1 or /adts/1.json
  def show
  end

  # GET /adts/new
  def new
    @adt = Adt.new
  end

  # GET /adts/1/edit
  def edit
  end

  # POST /adts or /adts.json
  def create
    @adt = Adt.new(adt_params)

    respond_to do |format|
      if @adt.save
        format.html { redirect_to @adt, notice: "Adt was successfully created." }
        format.json { render :show, status: :created, location: @adt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adts/1 or /adts/1.json
  def update
    respond_to do |format|
      if @adt.update(adt_params)
        format.html { redirect_to @adt, notice: "Adt was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @adt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adts/1 or /adts/1.json
  def destroy
    @adt.destroy!

    respond_to do |format|
      format.html { redirect_to adts_path, notice: "Adt was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adt
      @adt = Adt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adt_params
      params.require(:adt).permit(:reservist_id, :subject, :date_of_enlistment, :special_order_no, :special_order_no_date, :designation, :squadron)
    end
end
