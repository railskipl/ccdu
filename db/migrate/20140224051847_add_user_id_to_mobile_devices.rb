class AddUserIdToMobileDevices < ActiveRecord::Migration
  def change
    add_column :mobile_devices, :user_id, :integer
  end
end
