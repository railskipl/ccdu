class Admin::Zone < ActiveRecord::Base
	has_many :districts
	belongs_to :user
    attr_accessible :zone_name
end
