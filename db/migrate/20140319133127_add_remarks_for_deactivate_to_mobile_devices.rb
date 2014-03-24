class AddRemarksForDeactivateToMobileDevices < ActiveRecord::Migration
  def change
    add_column :mobile_devices, :remarks_for_deactivate, :text
  end
end
