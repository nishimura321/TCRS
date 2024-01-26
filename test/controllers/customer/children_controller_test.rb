require "test_helper"

class Customer::ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_children_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_children_edit_url
    assert_response :success
  end
end
