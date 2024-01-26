require "test_helper"

class Customer::FamiliesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_families_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_families_edit_url
    assert_response :success
  end
end
