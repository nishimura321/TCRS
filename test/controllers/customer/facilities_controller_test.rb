require "test_helper"

class Customer::FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_facilities_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_facilities_show_url
    assert_response :success
  end
end
