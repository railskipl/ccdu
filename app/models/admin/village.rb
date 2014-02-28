class Admin::Village < ActiveRecord::Base
  attr_accessible :grampanchyat_id, :village_name

  belongs_to :grampanchyat
  belongs_to :user
  has_many :habitations

  validates_presence_of :grampanchyat_id, :village_name

  before_save :upname
  #upcase the village name
  def upname
  	self.village_name = self.village_name.upcase
  end
end
