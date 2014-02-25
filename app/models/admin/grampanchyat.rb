class Admin::Grampanchyat < ActiveRecord::Base
  attr_accessible :block_id, :gram_name

  belongs_to :block
  belongs_to :user
  has_many :villages

  validates_presence_of :block_id, :gram_name

  before_save :upname

  def upname
  	self.gram_name = self.gram_name.upcase
  end
end
