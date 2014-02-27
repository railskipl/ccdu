class AddFullNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :block_name, :string
  end
end
