class AddDistrictNameToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :districtname, :string
  end
end
