class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).reverse
  end
end
