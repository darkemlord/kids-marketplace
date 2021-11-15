class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toy

  APPROVAL = %i[approved pending denied]
  enum approval_status: { approved: 0, pending: 1, denied: 2 }
end
