class CreateWaterSourceTypes < ActiveRecord::Migration
  def change
    create_table :water_source_types do |t|
      t.string :source_type

      t.timestamps
    end
  end
end
