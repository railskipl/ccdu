class MobileUser < ActiveRecord::Base
  attr_accessible :imei, :user_id

  belongs_to :user
end
