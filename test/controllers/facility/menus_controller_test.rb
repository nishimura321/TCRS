require "test_helper"

class Facility::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get facility_menus_new_url
    assert_response :success
  end

  test "should get index" do
    get facility_menus_index_url
    assert_response :success
  end

  test "should get edit" do
    get facility_menus_edit_url
    assert_response :success
  end
end
