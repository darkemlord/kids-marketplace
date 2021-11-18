class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :dates_available, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  enum condition: { "brand new": 0, damaged: 1, used: 2 }

  # Querying booking for availability
  def self.available(today, seven_days_from_now)
    # All items that are not currently being borrowed, and all items whose borrowing end date will is within 7 days
    # results = ActiveRecord::Base.connection.execute("SELECT * FROM bookings WHERE (bookings.toy_id = 164)")
    self.joins(:bookings).where("bookings.start_date > ? AND bookings.end_date > ?", today, seven_days_from_now).all
  end

  #def self.available_from()
  #  self.join(:bookings).where("bookings.start_date > ? AND bookings.end_date < ? AND bookings.approval_status = 1", start_start, end_date)
  #end
end
