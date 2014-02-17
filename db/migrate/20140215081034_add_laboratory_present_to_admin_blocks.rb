class AddLaboratoryPresentToAdminBlocks < ActiveRecord::Migration
  def change
    add_column :admin_blocks, :laboratory_present, :string
  end
end
