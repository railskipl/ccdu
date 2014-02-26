class AddAttachmentImage1ToSurveyReports < ActiveRecord::Migration
  def self.up
    change_table :survey_reports do |t|
      t.attachment :image1
    end
  end

  def self.down
    drop_attached_file :survey_reports, :image1
  end
end
