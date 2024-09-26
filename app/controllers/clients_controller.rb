class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :authorize_client, only: %i[ create destroy]
  before_action :authorize_client, only: [:create, :destroy]
  before_action :authorize_new, only: %i[new create]
  # GET /clients or /clients.json
  mount_uploader :birth_cert_img, ImageUploader
  def index
    @clients = policy_scope(Client)
  end

  # GET /clients/1 or /clients/1.json
  def show
    @loans = @client.loans
    @water_bills = @client.water_bills
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        History.create(user_id: current_user.id, description: "Creates a new client", model: "Client", model_id: @client.id)
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      original_attributes = @client.attributes.slice(*client_params.keys)

      if @client.update(client_params)
        updated_fields_with_values = client_params.keys.each_with_object({}) do |key, result|
          new_value = @client.send(key)
          if new_value != original_attributes[key.to_s]
            result[key] = {original_attributes[key.to_s] => new_value}
          end
        end

        History.create(user_id: current_user.id, description: "Updated Client: #{updated_fields_with_values.inspect}", model: "Client", model_id: @client.id)

        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    client_details = @client.attributes.slice(*@client.class.column_names)
    @client.destroy!

    History.create(user_id: current_user.id, description: "Deleted Client: #{client_details.inspect}")

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def authorize_client
      authorize @client if @client
    end
    def authorize_new
      authorize Client.new, :new?
    end
  
    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :mobile_number, :telephone_number, :email_address, :facebook_account_name, :address, :gender, :civil_status, :tin_number, :id_type, :id_number, :occupation, :years_employed, :employer_name, :employer_business_address, :spouse_name, :spouse_email, :spouse_contact_number, :spouse_address, :spouse_id_type, :spouse_id_number, :spouse_tin_number, :basic_salary, :annual_income, :status, :remarks, :documents, :birth_cert_img,:valid_id_img, :proof_of_income_img, :marriage_contract_img, :spa_img, :pdc_img)
    end
end
