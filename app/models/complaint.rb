class Complaint < ActiveRecord::Base
  attr_accessible :action_taken, :assigned_on, :assigned_to, :block_name, :closed_by, :closed_on, :district_name, :incident_description, :incident_title, :other_impact, :raised_by, :raised_on, :sample_impacted, :status, :supplier_name,:user_id,:priority
  belongs_to :user 
end
