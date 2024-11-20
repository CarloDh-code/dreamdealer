class Dream < ApplicationRecord
  has_many :bookings
  belongs_to :user

  has_many_attached :photos

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_per_night, presence: true
  CATEGORIES = ["action", "success", "lust", "dreamy", "adventure", "travel", "fantasy", "time traveler" ]
  validates :category, inclusion: {in: CATEGORIES}
  validates :age_limit, presence: true
  ROLES = (1..10).to_a
  validates :number_of_roles, inclusion: {in: ROLES}
end
