class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :supplier_name
      t.string :incident_title
      t.text :incident_description
      t.string :raised_by
      t.datetime :raised_on
      t.string :sample_impacted
      t.text :other_impact
      t.string :assigned_to
      t.date :assigned_on
      t.string :status
      t.date :closed_on
      t.string :closed_by
      t.string :action_taken
      t.string :district_name
      t.string :block_name

      t.timestamps
    end
  end
end
