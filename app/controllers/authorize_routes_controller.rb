class AuthorizeRoutesController < ApplicationController
  before_action :set_authorize_route, only: %i[ show edit update destroy ]

  # GET /authorize_routes or /authorize_routes.json
  def index
    @authorize_routes = AuthorizeRoute.all
  end

  # GET /authorize_routes/1 or /authorize_routes/1.json
  def show
  end

  # GET /authorize_routes/new
  def new
    @authorize_route = AuthorizeRoute.new
  end

  # GET /authorize_routes/1/edit
  def edit
  end

  # POST /authorize_routes or /authorize_routes.json
  def create
    @authorize_route = AuthorizeRoute.new(authorize_route_params)

    respond_to do |format|
      if @authorize_route.save
        format.html { redirect_to @authorize_route, notice: "Authorize route was successfully created." }
        format.json { render :show, status: :created, location: @authorize_route }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @authorize_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorize_routes/1 or /authorize_routes/1.json
  def update
    respond_to do |format|
      if @authorize_route.update(authorize_route_params)
        format.html { redirect_to @authorize_route, notice: "Authorize route was successfully updated." }
        format.json { render :show, status: :ok, location: @authorize_route }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @authorize_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorize_routes/1 or /authorize_routes/1.json
  def destroy
    @authorize_route.destroy!

    respond_to do |format|
      format.html { redirect_to authorize_routes_path, status: :see_other, notice: "Authorize route was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorize_route
      @authorize_route = AuthorizeRoute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def authorize_route_params
      params.require(:authorize_route).permit(:name, :route_type)
    end
end
