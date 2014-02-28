class AddRemarksToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :remarks, :string
  end
end
