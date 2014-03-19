class AddIsDistInvoiceToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :is_dist_invoice, :integer, :default => 0
  end
end
