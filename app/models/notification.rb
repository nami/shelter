class Notification < ApplicationRecord
  after_create_commit { NotificationBroadcastJob.perform_later(Notification.count) }

  belongs_to :comment
  belongs_to :user
  has_one :post, through: :comment
end
