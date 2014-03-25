class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username ,:role_ids, :mobile_no,
  :user_fullname, :zone_name, :district_name, :block_name,:status,:block_manager_id,:is_transfer, :old_manager_id
  # attr_accessible :title, :body
  has_many :zones
  has_many :district
  has_many :blocks
  has_many :grampanchyats
  has_many :villages
  has_many :habitations
  has_many :mobile_devices
  has_many :mobile_users
  has_many :block_laboratories
  has_many :survey_reports
  has_many :invoices
  has_many :complaints
  validates :username, :presence   => true ,:uniqueness => true
  
end
