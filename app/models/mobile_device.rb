class MobileDevice < ActiveRecord::Base
  attr_accessible :imei, :manufacturer_name, :phone_no, :purchase_date
end
