class Admin::Habitation < ActiveRecord::Base
  attr_accessible :habitation_name, :village_id

  belongs_to :village
  belongs_to :user

  validates_presence_of :habitation_name, :village_id

  before_save :upname

  #upcase the habitation name

  def upname
  	self.habitation_name = self.habitation_name.upcase
  end
end
