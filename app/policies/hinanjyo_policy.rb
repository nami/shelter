class HinanjyoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def favorite?
    return true
  end

  def details?
    return true
  end
end
