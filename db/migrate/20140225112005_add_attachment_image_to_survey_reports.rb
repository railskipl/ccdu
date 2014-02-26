class AddAttachmentImageToSurveyReports < ActiveRecord::Migration
  def self.up
    change_table :survey_reports do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :survey_reports, :image
  end
end
