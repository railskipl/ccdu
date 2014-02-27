class AddImeiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zone_name, :string
  end
end
