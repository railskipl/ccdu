class AddIsInvoicedToSurveyReports < ActiveRecord::Migration
  def change
    add_column :survey_reports, :is_invoiced, :integer, :default => 0
  end
end
