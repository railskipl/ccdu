class AddInvoiceIdToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :invoice_id, :integer
  end
end
