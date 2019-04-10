class Post < ApplicationRecord
  belongs_to :user
  belongs_to :hinanjyo
  has_many :comments, dependent: :destroy

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :help_type

  validates :title, presence: true
  validates :description, presence: true
end
