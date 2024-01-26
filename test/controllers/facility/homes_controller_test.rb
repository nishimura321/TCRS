require "test_helper"

class Facility::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get facility_homes_top_url
    assert_response :success
  end
end
