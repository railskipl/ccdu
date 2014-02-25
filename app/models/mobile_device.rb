class MobileDevice < ActiveRecord::Base
  attr_accessible :imei, :manufacturer_name, :phone_no, :purchase_date,:user_id

  validates_presence_of :imei, :manufacturer_name, :phone_no, :purchase_date,:user_id

end
