class Dream < ApplicationRecord
  has_many :bookings
  has_many :reviews, dependent: :destroy
  belongs_to :user

  has_many_attached :photos

  AGES = [12, 16, 18]

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_per_night, presence: true
  CATEGORIES = ["Action", "Success", "Lust", "Dreamy", "Adventure", "Travel", "Fantasy", "Time traveler", "Nightmare"]
  validates :category, inclusion: {in: CATEGORIES}
  validates :age_limit, presence: true, inclusion: {in: AGES}
  ROLES = (1..10).to_a
  validates :number_of_roles, inclusion: {in: ROLES}

  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :recent, -> { order(created_at: :desc) }
  scope :best_rated, -> { joins(:reviews).group('dreams.id').order('AVG(reviews.rating) DESC') }

  def average_rating
    return 0 if self.reviews.empty?
    ratings = self.reviews.pluck(:rating)
    ratings.sum.to_f / ratings.size
  end
end
