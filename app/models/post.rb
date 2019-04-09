class Post < ApplicationRecord
  belongs_to :user
  belongs_to :hinanjyo

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :help_type

  validates :title, presence: true
  validates :description, presence: true
end
