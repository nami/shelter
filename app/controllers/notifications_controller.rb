class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).reverse
    @today = Date.today
    @yesterday = @today - 1.days
    @month = @notifications.group_by { |t| t.created_at.month }
  end
end
