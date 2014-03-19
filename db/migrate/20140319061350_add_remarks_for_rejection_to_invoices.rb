class AddRemarksForRejectionToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :remarks_for_rejection, :text
  end
end
