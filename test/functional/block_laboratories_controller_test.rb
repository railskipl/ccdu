require 'test_helper'

class BlockLaboratoriesControllerTest < ActionController::TestCase
  setup do
    @block_laboratory = block_laboratories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:block_laboratories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create block_laboratory" do
    assert_difference('BlockLaboratory.count') do
      post :create, block_laboratory: { address: @block_laboratory.address, labname: @block_laboratory.labname }
    end

    assert_redirected_to block_laboratory_path(assigns(:block_laboratory))
  end

  test "should show block_laboratory" do
    get :show, id: @block_laboratory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @block_laboratory
    assert_response :success
  end

  test "should update block_laboratory" do
    put :update, id: @block_laboratory, block_laboratory: { address: @block_laboratory.address, labname: @block_laboratory.labname }
    assert_redirected_to block_laboratory_path(assigns(:block_laboratory))
  end

  test "should destroy block_laboratory" do
    assert_difference('BlockLaboratory.count', -1) do
      delete :destroy, id: @block_laboratory
    end

    assert_redirected_to block_laboratories_path
  end
end
