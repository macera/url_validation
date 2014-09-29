require 'test_helper'

class UrldataControllerTest < ActionController::TestCase
  setup do
    @urldatum = urldata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:urldata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create urldatum" do
    assert_difference('Urldatum.count') do
      post :create, urldatum: { text: @urldatum.text, url: @urldatum.url }
    end

    assert_redirected_to urldatum_path(assigns(:urldatum))
  end

  test "should show urldatum" do
    get :show, id: @urldatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @urldatum
    assert_response :success
  end

  test "should update urldatum" do
    patch :update, id: @urldatum, urldatum: { text: @urldatum.text, url: @urldatum.url }
    assert_redirected_to urldatum_path(assigns(:urldatum))
  end

  test "should destroy urldatum" do
    assert_difference('Urldatum.count', -1) do
      delete :destroy, id: @urldatum
    end

    assert_redirected_to urldata_path
  end
end
