class Post < ApplicationRecord
  belongs_to :user
  belongs_to :hinanjyo
  has_many :comments, dependent: :destroy

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :help_type
  acts_as_votable

  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_posts,
    against: {
      title: 'A',
      description: 'B'
    },
    # associated_against: {
    #   tags: [ :name]
    # },
    using: {
      tsearch: { prefix: true }
    }
end
