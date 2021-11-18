class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  # validates :dates_available, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  enum condition: { "Brand new": 0, "Damaged": 1, "Used": 2 }

  #include PgSearch::Model
  #pg_search_scope :search_by_name_and_description,
  #  against: [ :name, :description ],
  #  using: {
  #    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #  }
#
  # Querying booking for availability
  def self.unavailable(today, seven_days_from_now)
    # results = ActiveRecord::Base.connection.execute("SELECT * FROM bookings WHERE (bookings.toy_id = 164)")
    self.joins(:bookings).where("(bookings.start_date < ? AND bookings.end_date > ?) OR (bookings.start_date < ? AND bookings.end_date > ?)", today, seven_days_from_now, seven_days_from_now, seven_days_from_now).all
  end

end
