require 'test_helper'

class UrisControllerTest < ActionController::TestCase
  setup do
    @uri = uris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uri" do
    assert_difference('Uri.count') do
      post :create, uri: @uri.attributes
    end

    assert_redirected_to uri_path(assigns(:uri))
  end

  test "should show uri" do
    get :show, id: @uri
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uri
    assert_response :success
  end

  test "should update uri" do
    put :update, id: @uri, uri: @uri.attributes
    assert_redirected_to uri_path(assigns(:uri))
  end

  test "should destroy uri" do
    assert_difference('Uri.count', -1) do
      delete :destroy, id: @uri
    end

    assert_redirected_to uris_path
  end
end
