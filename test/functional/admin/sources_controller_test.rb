require 'test_helper'

class Admin::SourcesControllerTest < ActionController::TestCase
  setup do
    @admin_source = admin_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_source" do
    assert_difference('Admin::Source.count') do
      post :create, admin_source: { source_name: @admin_source.source_name }
    end

    assert_redirected_to admin_source_path(assigns(:admin_source))
  end

  test "should show admin_source" do
    get :show, id: @admin_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_source
    assert_response :success
  end

  test "should update admin_source" do
    put :update, id: @admin_source, admin_source: { source_name: @admin_source.source_name }
    assert_redirected_to admin_source_path(assigns(:admin_source))
  end

  test "should destroy admin_source" do
    assert_difference('Admin::Source.count', -1) do
      delete :destroy, id: @admin_source
    end

    assert_redirected_to admin_sources_path
  end
end
