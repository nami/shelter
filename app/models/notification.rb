class Notification < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  has_one :post, through: :comment
end
