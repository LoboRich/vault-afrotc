require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference("Client.count") do
      post clients_url, params: { client: { address: @client.address, annual_income: @client.annual_income, basic_salary: @client.basic_salary, civil_status: @client.civil_status, documents: @client.documents, email_address: @client.email_address, employer_business_address: @client.employer_business_address, employer_name: @client.employer_name, facebook_account_name: @client.facebook_account_name, gender: @client.gender, id_number: @client.id_number, id_type: @client.id_type, mobile_number: @client.mobile_number, name: @client.name, occupation: @client.occupation, remarks: @client.remarks, spouse_address: @client.spouse_address, spouse_contact_number: @client.spouse_contact_number, spouse_email: @client.spouse_email, spouse_id_number: @client.spouse_id_number, spouse_id_type: @client.spouse_id_type, spouse_name: @client.spouse_name, spouse_tin_number: @client.spouse_tin_number, status: @client.status, telephone_number: @client.telephone_number, tin_number: @client.tin_number, years_employed: @client.years_employed } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { address: @client.address, annual_income: @client.annual_income, basic_salary: @client.basic_salary, civil_status: @client.civil_status, documents: @client.documents, email_address: @client.email_address, employer_business_address: @client.employer_business_address, employer_name: @client.employer_name, facebook_account_name: @client.facebook_account_name, gender: @client.gender, id_number: @client.id_number, id_type: @client.id_type, mobile_number: @client.mobile_number, name: @client.name, occupation: @client.occupation, remarks: @client.remarks, spouse_address: @client.spouse_address, spouse_contact_number: @client.spouse_contact_number, spouse_email: @client.spouse_email, spouse_id_number: @client.spouse_id_number, spouse_id_type: @client.spouse_id_type, spouse_name: @client.spouse_name, spouse_tin_number: @client.spouse_tin_number, status: @client.status, telephone_number: @client.telephone_number, tin_number: @client.tin_number, years_employed: @client.years_employed } }
    assert_redirected_to client_url(@client)
  end

  test "should destroy client" do
    assert_difference("Client.count", -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
