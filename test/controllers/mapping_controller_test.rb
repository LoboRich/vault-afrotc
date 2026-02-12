require "test_helper"

class MappingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mapping_index_url
    assert_response :success
  end
end
