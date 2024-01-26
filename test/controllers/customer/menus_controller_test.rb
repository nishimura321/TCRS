require "test_helper"

class Customer::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_menus_index_url
    assert_response :success
  end
end
