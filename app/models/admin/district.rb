class Admin::District < ActiveRecord::Base
  has_many :blocks
  belongs_to :zone
  belongs_to :user
  attr_accessible :district_name, :zone_id, :code, :lab_name, :lab_present

  validates_presence_of :district_name, :zone_id, :code,:lab_present

  before_save :name_district, :labname
  #upcase the district_name,code 
  def name_district
  	self.district_name = self.district_name.upcase
  	self.code = self.code.upcase
  end

  def labname #lab name blank replace with nil else to upcase
  	if self.lab_present == "No"
  		self.lab_name = "NIL"
  	else
	  	if self.lab_name.blank?
	       self.lab_name = "NIL"
	    else
	   	   self.lab_name = self.lab_name.upcase
	   	end
	  end
  end
end
