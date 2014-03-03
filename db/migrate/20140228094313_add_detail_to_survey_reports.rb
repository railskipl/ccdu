class AddDetailToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :ph, :string
    add_column :survey_reports, :tds, :string
    add_column :survey_reports, :residual_chlorine, :string
    add_column :survey_reports, :fluoride, :string
    add_column :survey_reports, :chloride, :string
    add_column :survey_reports, :nitrate, :string
    add_column :survey_reports, :alkaliniy, :string
    add_column :survey_reports, :total_hardness, :string
    add_column :survey_reports, :bacteriological, :string
    add_column :survey_reports, :reason_for_rejecting, :text
    add_column :survey_reports, :is_tested, :boolean, :default=>false
  end
end