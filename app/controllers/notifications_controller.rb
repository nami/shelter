class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).reverse.group_by { |t| t.created_at.to_date }.map { |k, v| [k, v.first] }.to_h
    policy_scope(Notification).update_all(checked: true)

    Time.zone = "Japan"
    @today = Date.today
    @yesterday = @today - 1.days
  end
end
