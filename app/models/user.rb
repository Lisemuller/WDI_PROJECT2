require 'carrierwave/orm/activerecord'
require_relative '../uploaders/profile_pic_uploader'

class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  has_and_belongs_to_many :folders
  has_and_belongs_to_many(:friends,
    join_table: "users_friends",
    foreign_key: "user_id",
    association_foreign_key: "friend_id",
    class_name: "User"
  )
  mount_uploader :profile_pic, ProfilePicUploader
end