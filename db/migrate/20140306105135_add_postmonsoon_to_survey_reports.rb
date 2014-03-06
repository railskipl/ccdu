class AddPostmonsoonToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :postmonsoon, :string
  end
end
