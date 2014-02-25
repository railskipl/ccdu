class MobileUser < ActiveRecord::Base
  attr_accessible :imei, :mobile_user_id,:user_id

  belongs_to :user

  validates_presence_of :imei, :mobile_user_id,:user_id
end
