class SurveyReport < ActiveRecord::Base


  attr_accessible :date_time, :grampanchayat,:latitude,:longitude, :habitation, :source_code, :source_location, :source_name, :surveyor_name, :village, :water_source_type, :image, :image1, :ph, :tds, :residual_chlorine, :fluoride, :chloride, :nitrate, :alkaliniy, :total_hardness, :bacteriological, :actions, :is_tested, :reason_for_rejecting, :district_name, :block_name,:survey_no,:remarks,:water_source_code, :reason_for_dist_rejected, :is_dist_approved, :district_level_status


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

end
