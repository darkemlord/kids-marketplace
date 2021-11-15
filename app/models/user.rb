class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :toys, dependent: :destroy
  has_many :bookings_as_owner, through: :toys, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
end
