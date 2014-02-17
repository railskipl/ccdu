class Admin::Grampanchyat < ActiveRecord::Base
  attr_accessible :block_id, :gram_name

  belongs_to :block
  belongs_to :user
  has_many :villages
end
