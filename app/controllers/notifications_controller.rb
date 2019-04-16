class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
                                               .group_by { |t| t.created_at.to_date }
                                               .transform_values { |v| v.flatten }
    # raise
    policy_scope(Notification).update_all(checked: true)
    @today = Date.today
    @yesterday = @today - 1.days
  end
end
