require 'test_helper'

class ShortsControllerTest < ActionController::TestCase
  setup do
    @short = shorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short" do
    assert_difference('Short.count') do
      post :create, short: @short.attributes
    end

    assert_redirected_to short_path(assigns(:short))
  end

  test "should show short" do
    get :show, id: @short
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @short
    assert_response :success
  end

  test "should update short" do
    put :update, id: @short, short: @short.attributes
    assert_redirected_to short_path(assigns(:short))
  end

  test "should destroy short" do
    assert_difference('Short.count', -1) do
      delete :destroy, id: @short
    end

    assert_redirected_to shorts_path
  end
end
