class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_ID, :string
    add_column :users, :mobile_no, :string
  end
end
