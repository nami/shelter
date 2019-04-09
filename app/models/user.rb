class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true, presence: true
  validates :phone, uniqueness: true, presence: true
  validates :sei, presence: true
  validates :mei, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sei_kana, presence: true
  validates :mei_kana, presence: true
  validates :photo_id, presence: true
  has_many :posts
  has_many :comments
  mount_uploader :avatar, PhotoUploader
  mount_uploader :photo_id, PhotoUploader
end
