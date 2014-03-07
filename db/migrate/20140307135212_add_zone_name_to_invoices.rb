class AddZoneNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :zone_name, :string
  end
end
