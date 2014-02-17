require 'test_helper'

class Admin::VillagesControllerTest < ActionController::TestCase
  setup do
    @admin_village = admin_villages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_villages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_village" do
    assert_difference('Admin::Village.count') do
      post :create, admin_village: { grampanchyat_id: @admin_village.grampanchyat_id, village_name: @admin_village.village_name }
    end

    assert_redirected_to admin_village_path(assigns(:admin_village))
  end

  test "should show admin_village" do
    get :show, id: @admin_village
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_village
    assert_response :success
  end

  test "should update admin_village" do
    put :update, id: @admin_village, admin_village: { grampanchyat_id: @admin_village.grampanchyat_id, village_name: @admin_village.village_name }
    assert_redirected_to admin_village_path(assigns(:admin_village))
  end

  test "should destroy admin_village" do
    assert_difference('Admin::Village.count', -1) do
      delete :destroy, id: @admin_village
    end

    assert_redirected_to admin_villages_path
  end
end
