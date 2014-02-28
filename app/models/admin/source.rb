class Admin::Source < ActiveRecord::Base
  attr_accessible :source_name, :code

  validates_presence_of :source_name, :code

  before_save :upname

  #upcase the source name
  def upname
  	self.source_name = self.source_name.upcase
  end
end
