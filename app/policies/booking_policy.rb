class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings
    end
  end

  def create?
    return true
  end

  def update?
    user == record.toy.user
  end
end
