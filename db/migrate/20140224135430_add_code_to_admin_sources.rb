class AddCodeToAdminSources < ActiveRecord::Migration
  def change
    add_column :admin_sources, :code, :string
  end
end
