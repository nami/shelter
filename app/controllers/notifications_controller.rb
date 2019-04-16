class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).reverse.group_by { |t| t.created_at.to_date }.map { |k, v| [k, v.first] }.to_h
    # @notifications.each do |notification|
    #   notification_day = custom_format(notification.created_at.to_date)
    #   unless @sorted_notifications.key?(notification_day)
    #     @sorted_notifications[notification_day] = []
    #   end
    #   @sorted_notifications[notification_day] << notification
    # end
    Time.zone = "Japan"
    @today = Date.today
    @yesterday = @today - 1.days
  end
end
