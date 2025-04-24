require "test_helper"

class AnouncesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anounces_index_url
    assert_response :success
  end

  test "should get show" do
    get anounces_show_url
    assert_response :success
  end

  test "should get new" do
    get anounces_new_url
    assert_response :success
  end

  test "should get create" do
    get anounces_create_url
    assert_response :success
  end

  test "should get edit" do
    get anounces_edit_url
    assert_response :success
  end

  test "should get update" do
    get anounces_update_url
    assert_response :success
  end

  test "should get destroy" do
    get anounces_destroy_url
    assert_response :success
  end
end
