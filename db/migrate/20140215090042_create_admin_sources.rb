class CreateAdminSources < ActiveRecord::Migration
  def change
    create_table :admin_sources do |t|
      t.string :source_name

      t.timestamps
    end
  end
end
