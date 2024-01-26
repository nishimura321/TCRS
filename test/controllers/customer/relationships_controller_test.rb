require "test_helper"

class Customer::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_relationships_index_url
    assert_response :success
  end
end
