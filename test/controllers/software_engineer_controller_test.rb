require 'test_helper'

class SoftwareEngineerControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get software_engineer_welcome_url
    assert_response :success
  end

end
