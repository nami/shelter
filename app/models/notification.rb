class Notification < ApplicationRecord
  after_create_commit :broadcast_message

  scope :checked, -> { where(checked: true) }
  scope :unchecked, -> { where(checked: false) }

  belongs_to :comment
  belongs_to :user
  has_one :post, through: :comment

  def broadcast_message
    NotificationBroadcastJob.perform_now(Notification.count, self)
  end
end
