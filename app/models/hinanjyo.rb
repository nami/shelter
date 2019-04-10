class Hinanjyo < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :prefecture, presence: true
  validates :place_name, presence: true
  validates :street, presence: true
  
  acts_as_votable
  geocoded_by :street
  after_validation :geocode, if: :will_save_change_to_street?
end
