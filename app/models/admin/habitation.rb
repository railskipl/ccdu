class Admin::Habitation < ActiveRecord::Base
  attr_accessible :habitation_name, :village_id

  belongs_to :village
  belongs_to :user
end
