class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_fullname, :string
    add_column :users, :mobile_no, :string
    add_column :users, :district_name, :string
  end
end
