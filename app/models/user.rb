class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username ,:role_ids, :mobile_no,:user_ID,:imei
  # attr_accessible :title, :body
  # validates_presence_of :email, :password, :password_confirmation, :username ,:role_ids,:user_ID
  has_many :zones
  has_many :district
  has_many :blocks
  has_many :grampanchyats
  has_many :villages
  has_many :habitations
  has_many :mobile_devices
  has_many :mobile_users
  has_many :block_laboratories
end
