require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:athletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post :create, :athlete => { }
    end

    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should show athlete" do
    get :show, :id => athletes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => athletes(:one).to_param
    assert_response :success
  end

  test "should update athlete" do
    put :update, :id => athletes(:one).to_param, :athlete => { }
    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should destroy athlete" do
    assert_difference('Athlete.count', -1) do
      delete :destroy, :id => athletes(:one).to_param
    end

    assert_redirected_to athletes_path
  end
end
