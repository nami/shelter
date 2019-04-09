class Post < ApplicationRecord
  belongs_to :user
  belongs_to :hinanjyo

  validates :title, presence: true
  validates :description, presence: true
end
