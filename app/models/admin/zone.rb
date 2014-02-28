class Admin::Zone < ActiveRecord::Base
	has_many :districts
	belongs_to :user
    attr_accessible :zone_name

    validates_presence_of :zone_name

    before_save :upname
    #upcase the zone name
    def upname
    	self.zone_name = self.zone_name.upcase
    end
end
