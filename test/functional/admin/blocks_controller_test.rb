require 'test_helper'

class Admin::BlocksControllerTest < ActionController::TestCase
  setup do
    @admin_block = admin_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_block" do
    assert_difference('Admin::Block.count') do
      post :create, admin_block: { block_name: @admin_block.block_name, district_id: @admin_block.district_id }
    end

    assert_redirected_to admin_block_path(assigns(:admin_block))
  end

  test "should show admin_block" do
    get :show, id: @admin_block
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_block
    assert_response :success
  end

  test "should update admin_block" do
    put :update, id: @admin_block, admin_block: { block_name: @admin_block.block_name, district_id: @admin_block.district_id }
    assert_redirected_to admin_block_path(assigns(:admin_block))
  end

  test "should destroy admin_block" do
    assert_difference('Admin::Block.count', -1) do
      delete :destroy, id: @admin_block
    end

    assert_redirected_to admin_blocks_path
  end
end
