require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get reserch" do
    get :reserch
    assert_response :success
  end

  test "should get member" do
    get :member
    assert_response :success
  end

  test "should get publication" do
    get :publication
    assert_response :success
  end

  test "should get lecture" do
    get :lecture
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get access" do
    get :access
    assert_response :success
  end

end
