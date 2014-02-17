class Admin::Block < ActiveRecord::Base
	belongs_to :district
	belongs_to :user
	has_many :grampanchyats
  attr_accessible :block_name, :district_id, :code, :lab_name, :laboratory_present
end
