class NotificationsController < ApplicationController
  def index
    policy_scope(Notification).update_all(checked: true)
    @notifications = policy_scope(Notification).reverse
  end
end
