class CreateSurveyReports < ActiveRecord::Migration
  def change
    create_table :survey_reports do |t|
      t.string :source_name
      t.string :source_code
      t.string :source_location
      t.string :habitation
      t.string :village
      t.string :grampanchayat
      t.string :water_source_type
      t.datetime :date_time
      t.string :surveyor_name
      t.timestamps
    end
  end
end
