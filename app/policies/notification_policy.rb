class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user: user).joins(:comment).where.not("comments.user_id = ? ", user.id)
    end
  end
end
