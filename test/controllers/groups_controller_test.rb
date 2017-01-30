require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

  test "should get leave" do
    get :leave
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
