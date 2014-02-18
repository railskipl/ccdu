class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :ph
      t.string :hardness
      t.string :alkalinity
      t.string :chloride
      t.string :nitrate
      t.string :fluroide
      t.string :residual_chlorine
      t.string :tds
      t.string :bact
      t.string :sanitary_survey
      t.string :no_of_chemical_sample

      t.timestamps
    end
  end
end
