class Admin::Village < ActiveRecord::Base
  attr_accessible :grampanchyat_id, :village_name

  belongs_to :grampanchyat
  belongs_to :user
  has_many :habitations
end
