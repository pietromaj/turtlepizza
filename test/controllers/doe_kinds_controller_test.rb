require 'test_helper'

class DoeKindsControllerTest < ActionController::TestCase
  setup do
    @doe_kind = doe_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doe_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doe_kind" do
    assert_difference('DoeKind.count') do
      post :create, doe_kind: { name: @doe_kind.name }
    end

    assert_redirected_to doe_kind_path(assigns(:doe_kind))
  end

  test "should show doe_kind" do
    get :show, id: @doe_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doe_kind
    assert_response :success
  end

  test "should update doe_kind" do
    patch :update, id: @doe_kind, doe_kind: { name: @doe_kind.name }
    assert_redirected_to doe_kind_path(assigns(:doe_kind))
  end

  test "should destroy doe_kind" do
    assert_difference('DoeKind.count', -1) do
      delete :destroy, id: @doe_kind
    end

    assert_redirected_to doe_kinds_path
  end
end
