class AddPriorityToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :priority, :string
  end
end
