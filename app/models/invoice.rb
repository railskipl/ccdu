class Invoice < ActiveRecord::Base
  attr_accessible :amount,:user_id, :block_name, :district_name, :invoice_date, :invoice_no, :is_invoice, :no_of_sample, :remark,:zone_name,:remarks_for_rejection, :is_dist_invoice,:is_invoiced, :invoice_id
  
  validates_presence_of :invoice_date, :invoice_no, :no_of_sample, :remark, :amount
  belongs_to :user
end
