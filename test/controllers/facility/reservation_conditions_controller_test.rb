require "test_helper"

class Facility::ReservationConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get facility_reservation_conditions_new_url
    assert_response :success
  end
end
