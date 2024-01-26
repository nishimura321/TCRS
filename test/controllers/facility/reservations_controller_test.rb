require "test_helper"

class Facility::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facility_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get facility_reservations_show_url
    assert_response :success
  end

  test "should get edit" do
    get facility_reservations_edit_url
    assert_response :success
  end

  test "should get situation" do
    get facility_reservations_situation_url
    assert_response :success
  end
end
