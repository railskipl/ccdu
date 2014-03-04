class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :district_name
      t.string :block_name
      t.date :invoice_date
      t.integer :no_of_sample
      t.float :amount
      t.string :invoice_no
      t.text :remark
      t.integer :is_invoice,  :default => 0
      t.date :approved_date
      t.timestamps
    end
  end
end
