class BlockLaboratory < ActiveRecord::Base
  attr_accessible :address, :labname, :user_id

  belongs_to :user

  validates_presence_of :labname, :user_id
end
