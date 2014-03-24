class AddActionsToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :actions, :integer, :default => 0
  end
end
