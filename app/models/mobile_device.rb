class MobileDevice < ActiveRecord::Base
  attr_accessible :imei, :manufacturer_name, :phone_no, :purchase_date,:user_id,:remarks_for_deactivate, :status

  validates_presence_of :imei, :manufacturer_name, :phone_no, :purchase_date,:user_id

end
