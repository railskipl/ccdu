class CreateMobileDevices < ActiveRecord::Migration
  def change
    create_table :mobile_devices do |t|
      t.string :imei
      t.string :manufacturer_name
      t.string :phone_no
      t.date :purchase_date

      t.timestamps
    end
  end
end
