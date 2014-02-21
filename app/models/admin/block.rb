class Admin::Block < ActiveRecord::Base
	belongs_to :district
	belongs_to :user
	has_many :grampanchyats
  attr_accessible :block_name, :district_id, :code, :lab_name, :laboratory_present

  before_save :name_code

  def name_code
  	 
  	self.block_name = self.block_name.upcase
  	
  	self.code = self.block_name[0..2]
  	
  end
end
