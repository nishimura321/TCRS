require "test_helper"

class Customer::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_reservations_new_url
    assert_response :success
  end

  test "should get confirm" do
    get customer_reservations_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get customer_reservations_thanks_url
    assert_response :success
  end

  test "should get index" do
    get customer_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_reservations_show_url
    assert_response :success
  end

  test "should get confirm_allergy" do
    get customer_reservations_confirm_allergy_url
    assert_response :success
  end

  test "should get edit" do
    get customer_reservations_edit_url
    assert_response :success
  end
end
