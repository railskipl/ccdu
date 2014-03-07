class AddZoneNameToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :zone_name, :string
  end
end
