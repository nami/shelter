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
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, PhotoUploader
  mount_uploader :photo_id, PhotoUploader

  acts_as_voter

  # user can toggle favorite shelter
  # delete other favorites before setting a new shelter to favorite
  def favorite_shelter(shelter)
    if voted_for? shelter
      shelter.unliked_by self
    else
      get_voted(Hinanjyo).each do |voted_shelter|
        voted_shelter.unliked_by self
      end
      shelter.liked_by self
    end
  end

end
