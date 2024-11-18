class Dream < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_one_attached :photo

  validates :title, presence: true, uniqueness: true, length: {minimum: 10, message: "please dream more than 10 caracters"}
  validates :description, presence: true, uniqueness: true, length: {minimum: 10, message: "please dream more than 10 caracters"}
  validates :price_per_night, presence: true
  CATEGORIES = ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler" ]
  validates :category, inclusion: {in: CATEGORIES}
  validates :age_limit, presence: true
  ROLES = (1..10)
  validates :number_of_roles, inclusion: {in: ROLES}
end
