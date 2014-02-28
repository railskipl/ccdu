class AddDistrictToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :district_name, :string
    add_column :survey_reports, :block_name, :string
  end
end
