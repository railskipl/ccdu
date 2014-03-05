class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username ,:role_ids, :mobile_no,
  :user_fullname, :zone_name, :district_name, :block_name,:status,:block_manager_id
  # attr_accessible :title, :body
  has_many :zones,dependent: :destroy
  has_many :district,dependent: :destroy
  has_many :blocks,dependent: :destroy
  has_many :grampanchyats,dependent: :destroy
  has_many :villages,dependent: :destroy
  has_many :habitations,dependent: :destroy
  has_many :mobile_devices,dependent: :destroy
  has_many :mobile_users,dependent: :destroy
  has_many :block_laboratories,dependent: :destroy
  has_many :survey_reports, dependent: :destroy
  has_many :invoices, dependent: :destroy

  before_save :check_area
  #check role & than save area of user
  def check_area 
    role = Role.find_by_id(self.role_ids)
    if role.name == "zone"
       self.zone_name = self.zone_name
       self.district_name = nil
       self.block_name = nil
    elsif 
      role.name == "district"
      self.zone_name =  self.zone_name
      self.district_name = self.district_name
      self.block_name = nil
    else 
      role.name == "block"
      self.zone_name = nil
      self.district_name = self.district_name
      self.block_name = self.block_name
    end
  end
end
