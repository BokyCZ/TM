require 'test_helper'

class QualificationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get edit_all" do
    get :edit_all
    assert_response :success
  end

end
