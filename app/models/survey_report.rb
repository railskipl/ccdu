class SurveyReport < ActiveRecord::Base
  attr_accessible :date_time, :grampanchayat, :habitation, :source_code, :source_location, :source_name, :surveyor_name, :village, :water_source_type, :image, :image1

  has_attached_file :image, :styles => { :small => "150x150>" }
  has_attached_file :image1, :styles => { :small => "150x150>" }

  # before_save :sample_number

  # def sample_number
  # 	@survey_report = SurveyReport.all
  # 	raise @survey_report.count.inspect
  # end
end
