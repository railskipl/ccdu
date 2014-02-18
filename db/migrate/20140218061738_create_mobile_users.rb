class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.integer :user_id
      t.string :imei

      t.timestamps
    end
  end
end
