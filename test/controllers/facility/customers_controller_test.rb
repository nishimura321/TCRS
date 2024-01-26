require "test_helper"

class Facility::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get facility_customers_show_url
    assert_response :success
  end
end
