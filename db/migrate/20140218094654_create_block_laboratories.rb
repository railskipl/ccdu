class CreateBlockLaboratories < ActiveRecord::Migration
  def change
    create_table :block_laboratories do |t|
      t.string :labname
      t.text :address

      t.timestamps
    end
  end
end
