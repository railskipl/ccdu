class AddAttachmentPhoto1ToSurveyReports < ActiveRecord::Migration
  def self.up
    change_table :survey_reports do |t|
      t.attachment :photo1
    end
  end

  def self.down
    drop_attached_file :survey_reports, :photo1
  end
end
