class AddSurveyNoToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :survey_no, :integer
  end
end
