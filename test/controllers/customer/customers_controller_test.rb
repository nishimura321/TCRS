require "test_helper"

class Customer::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get customer_customers_edit_url
    assert_response :success
  end

  test "should get confirm_withdrawal" do
    get customer_customers_confirm_withdrawal_url
    assert_response :success
  end
end
