class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toy

  enum approval_status: { approved: 0, pending: 1, denied: 2 }
  enum delivery_option: { "Delivery": 0, "Pick Up": 1 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :delivery_option, presence: true

  def pending?
    approval_status == 'pending'
  end
end
