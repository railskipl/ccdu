class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :priority_name

      t.timestamps
    end
  end
end
