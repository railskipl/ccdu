class AddWaterSourceCodeToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :water_source_code, :string
  end
end
