class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username ,:role_ids, :mobile_no,:user_ID,:imei
  # attr_accessible :title, :body
  has_many :zones
  has_many :district
  has_many :blocks
  has_many :grampanchyats
  has_many :villages
  has_many :habitations
end
