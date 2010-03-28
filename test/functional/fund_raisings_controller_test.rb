require 'test_helper'

class FundRaisingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fund_raisings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fund_raising" do
    assert_difference('FundRaising.count') do
      post :create, :fund_raising => { }
    end

    assert_redirected_to fund_raising_path(assigns(:fund_raising))
  end

  test "should show fund_raising" do
    get :show, :id => fund_raisings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fund_raisings(:one).to_param
    assert_response :success
  end

  test "should update fund_raising" do
    put :update, :id => fund_raisings(:one).to_param, :fund_raising => { }
    assert_redirected_to fund_raising_path(assigns(:fund_raising))
  end

  test "should destroy fund_raising" do
    assert_difference('FundRaising.count', -1) do
      delete :destroy, :id => fund_raisings(:one).to_param
    end

    assert_redirected_to fund_raisings_path
  end
end
