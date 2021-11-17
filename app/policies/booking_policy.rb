class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def update?
    return true
  end
end
