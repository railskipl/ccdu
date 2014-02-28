class SurveyReport < ActiveRecord::Base
  attr_accessible :date_time, :grampanchayat, :habitation, :source_code, 
                  :source_location, :source_name, :surveyor_name, :village, :water_source_type, 
                  :image, :image1,:district_name,:block_name,:survey_no,:remarks

  has_attached_file :image, 
  					:styles => { :small => "150x150>" },
  					:storage => :s3,
					:s3_credentials => "#{Rails.root}/config/s3.yml",
					:path => "image/:id/:style/:basename.:extension"

  has_attached_file :image1, 
  					:styles => { :small => "150x150>" },
  					:storage => :s3,
					:s3_credentials => "#{Rails.root}/config/s3.yml",
					:path => "image1/:id/:style/:basename.:extension"

  # before_save :sample_number

  # def sample_number
  # 	@survey_report = SurveyReport.all
  # 	raise @survey_report.count.inspect
  # end
end
