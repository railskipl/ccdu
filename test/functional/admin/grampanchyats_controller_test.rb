require 'test_helper'

class Admin::GrampanchyatsControllerTest < ActionController::TestCase
  setup do
    @admin_grampanchyat = admin_grampanchyats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_grampanchyats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_grampanchyat" do
    assert_difference('Admin::Grampanchyat.count') do
      post :create, admin_grampanchyat: { block_id: @admin_grampanchyat.block_id, gram_name: @admin_grampanchyat.gram_name }
    end

    assert_redirected_to admin_grampanchyat_path(assigns(:admin_grampanchyat))
  end

  test "should show admin_grampanchyat" do
    get :show, id: @admin_grampanchyat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_grampanchyat
    assert_response :success
  end

  test "should update admin_grampanchyat" do
    put :update, id: @admin_grampanchyat, admin_grampanchyat: { block_id: @admin_grampanchyat.block_id, gram_name: @admin_grampanchyat.gram_name }
    assert_redirected_to admin_grampanchyat_path(assigns(:admin_grampanchyat))
  end

  test "should destroy admin_grampanchyat" do
    assert_difference('Admin::Grampanchyat.count', -1) do
      delete :destroy, id: @admin_grampanchyat
    end

    assert_redirected_to admin_grampanchyats_path
  end
end
