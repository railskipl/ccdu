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
  validates :username, :presence   => true ,:uniqueness => true
  before_save :check_area
  #check role & than save area of user
  def check_area 
    role = Role.find_by_id(self.role_ids)
    if role.name == "zone"
       self.zone_name = self.zone_name
       self.district_name = nil
       self.block_name = nil
    elsif role.name == "district"
      self.zone_name =  self.zone_name
      self.district_name = self.district_name
      self.block_name = nil
    elsif role.name == "block"
      self.zone_name = nil
      self.district_name = self.district_name
      self.block_name = self.block_name
    elsif role.name == "mobile"
      self.zone_name = nil
      self.district_name = nil
      self.block_name = nil
    elsif role.name == "admin"
      self.zone_name = nil
      self.district_name = nil
      self.block_name = nil
    end
    
  end
end
