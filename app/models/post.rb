class Post < ApplicationRecord
  belongs_to :user
  belongs_to :hinanjyo
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
