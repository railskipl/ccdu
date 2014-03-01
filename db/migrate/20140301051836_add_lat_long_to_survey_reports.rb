class AddLatLongToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :latitude, :float
    add_column :survey_reports, :longitude, :float
  end
end
