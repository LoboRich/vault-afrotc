require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Address", with: @client.address
    fill_in "Annual income", with: @client.annual_income
    fill_in "Basic salary", with: @client.basic_salary
    fill_in "Civil status", with: @client.civil_status
    fill_in "Documents", with: @client.documents
    fill_in "Email address", with: @client.email_address
    fill_in "Employer business address", with: @client.employer_business_address
    fill_in "Employer name", with: @client.employer_name
    fill_in "Facebook account name", with: @client.facebook_account_name
    fill_in "Gender", with: @client.gender
    fill_in "Id number", with: @client.id_number
    fill_in "Id type", with: @client.id_type
    fill_in "Mobile number", with: @client.mobile_number
    fill_in "Name", with: @client.name
    fill_in "Occupation", with: @client.occupation
    fill_in "Remarks", with: @client.remarks
    fill_in "Spouse address", with: @client.spouse_address
    fill_in "Spouse contact number", with: @client.spouse_contact_number
    fill_in "Spouse email", with: @client.spouse_email
    fill_in "Spouse id number", with: @client.spouse_id_number
    fill_in "Spouse id type", with: @client.spouse_id_type
    fill_in "Spouse name", with: @client.spouse_name
    fill_in "Spouse tin number", with: @client.spouse_tin_number
    fill_in "Status", with: @client.status
    fill_in "Telephone number", with: @client.telephone_number
    fill_in "Tin number", with: @client.tin_number
    fill_in "Years employed", with: @client.years_employed
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Address", with: @client.address
    fill_in "Annual income", with: @client.annual_income
    fill_in "Basic salary", with: @client.basic_salary
    fill_in "Civil status", with: @client.civil_status
    fill_in "Documents", with: @client.documents
    fill_in "Email address", with: @client.email_address
    fill_in "Employer business address", with: @client.employer_business_address
    fill_in "Employer name", with: @client.employer_name
    fill_in "Facebook account name", with: @client.facebook_account_name
    fill_in "Gender", with: @client.gender
    fill_in "Id number", with: @client.id_number
    fill_in "Id type", with: @client.id_type
    fill_in "Mobile number", with: @client.mobile_number
    fill_in "Name", with: @client.name
    fill_in "Occupation", with: @client.occupation
    fill_in "Remarks", with: @client.remarks
    fill_in "Spouse address", with: @client.spouse_address
    fill_in "Spouse contact number", with: @client.spouse_contact_number
    fill_in "Spouse email", with: @client.spouse_email
    fill_in "Spouse id number", with: @client.spouse_id_number
    fill_in "Spouse id type", with: @client.spouse_id_type
    fill_in "Spouse name", with: @client.spouse_name
    fill_in "Spouse tin number", with: @client.spouse_tin_number
    fill_in "Status", with: @client.status
    fill_in "Telephone number", with: @client.telephone_number
    fill_in "Tin number", with: @client.tin_number
    fill_in "Years employed", with: @client.years_employed
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
