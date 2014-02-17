require 'test_helper'

class Admin::ZonesControllerTest < ActionController::TestCase
  setup do
    @admin_zone = admin_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_zone" do
    assert_difference('Admin::Zone.count') do
      post :create, admin_zone: { zone_name: @admin_zone.zone_name }
    end

    assert_redirected_to admin_zone_path(assigns(:admin_zone))
  end

  test "should show admin_zone" do
    get :show, id: @admin_zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_zone
    assert_response :success
  end

  test "should update admin_zone" do
    put :update, id: @admin_zone, admin_zone: { zone_name: @admin_zone.zone_name }
    assert_redirected_to admin_zone_path(assigns(:admin_zone))
  end

  test "should destroy admin_zone" do
    assert_difference('Admin::Zone.count', -1) do
      delete :destroy, id: @admin_zone
    end

    assert_redirected_to admin_zones_path
  end
end
