require 'test_helper'

class SimpleCountControllerTest < ActionDispatch::IntegrationTest
  test "should get letter_a" do
    get simple_count_letter_a_url
    assert_response :success
  end

  test "should get any_letter" do
    get simple_count_any_letter_url
    assert_response :success
  end

end
