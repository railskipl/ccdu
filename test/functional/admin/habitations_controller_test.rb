require 'test_helper'

class Admin::HabitationsControllerTest < ActionController::TestCase
  setup do
    @admin_habitation = admin_habitations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_habitations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_habitation" do
    assert_difference('Admin::Habitation.count') do
      post :create, admin_habitation: { habitation_name: @admin_habitation.habitation_name, village_id: @admin_habitation.village_id }
    end

    assert_redirected_to admin_habitation_path(assigns(:admin_habitation))
  end

  test "should show admin_habitation" do
    get :show, id: @admin_habitation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_habitation
    assert_response :success
  end

  test "should update admin_habitation" do
    put :update, id: @admin_habitation, admin_habitation: { habitation_name: @admin_habitation.habitation_name, village_id: @admin_habitation.village_id }
    assert_redirected_to admin_habitation_path(assigns(:admin_habitation))
  end

  test "should destroy admin_habitation" do
    assert_difference('Admin::Habitation.count', -1) do
      delete :destroy, id: @admin_habitation
    end

    assert_redirected_to admin_habitations_path
  end
end
