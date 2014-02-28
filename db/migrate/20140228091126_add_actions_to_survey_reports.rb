class AddActionsToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :actions, :integer, :default => 0
  end
end
