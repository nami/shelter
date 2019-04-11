class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user: user)
    end
  end
end
