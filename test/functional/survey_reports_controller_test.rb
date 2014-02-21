require 'test_helper'

class SurveyReportsControllerTest < ActionController::TestCase
  setup do
    @survey_report = survey_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_report" do
    assert_difference('SurveyReport.count') do
      post :create, survey_report: { date_time: @survey_report.date_time, grampanchayat: @survey_report.grampanchayat, habitation: @survey_report.habitation, source_code: @survey_report.source_code, source_location: @survey_report.source_location, source_name: @survey_report.source_name, surveyor_name: @survey_report.surveyor_name, village: @survey_report.village, water_source_type: @survey_report.water_source_type }
    end

    assert_redirected_to survey_report_path(assigns(:survey_report))
  end

  test "should show survey_report" do
    get :show, id: @survey_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_report
    assert_response :success
  end

  test "should update survey_report" do
    put :update, id: @survey_report, survey_report: { date_time: @survey_report.date_time, grampanchayat: @survey_report.grampanchayat, habitation: @survey_report.habitation, source_code: @survey_report.source_code, source_location: @survey_report.source_location, source_name: @survey_report.source_name, surveyor_name: @survey_report.surveyor_name, village: @survey_report.village, water_source_type: @survey_report.water_source_type }
    assert_redirected_to survey_report_path(assigns(:survey_report))
  end

  test "should destroy survey_report" do
    assert_difference('SurveyReport.count', -1) do
      delete :destroy, id: @survey_report
    end

    assert_redirected_to survey_reports_path
  end
end
