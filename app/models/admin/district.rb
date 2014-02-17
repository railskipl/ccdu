class Admin::District < ActiveRecord::Base
  has_many :blocks
  belongs_to :zone
  belongs_to :user
  attr_accessible :district_name, :zone_id, :code, :lab_name, :lab_present
end
