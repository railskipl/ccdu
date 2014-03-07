class Admin::Block < ActiveRecord::Base
	belongs_to :district
	belongs_to :user
	has_many :grampanchyats
  attr_accessible :block_name, :district_id, :code, :lab_name, :laboratory_present

  

  before_save :name_code, :labname

  #upcase the block_name, limit code to 3 charactors
  def name_code
  	 
  	self.block_name = self.block_name.upcase
  	
  	self.code = self.block_name[0..2]
  end
  #change laboratory name to nil if laboratory name is nil
  def labname #lab name blank replace with nil else to upcase
    if self.laboratory_present == "No"
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
