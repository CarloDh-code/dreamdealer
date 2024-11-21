class Booking < ApplicationRecord
  has_many :reviews

  belongs_to :user
  belongs_to :dream

  validates :start_date, :end_date, presence: true
  def total_price
    return 0 unless end_date.present? && start_date.present? && price_per_night.present?

    (self.end_date - self.start_date).to_i * self.price_per_night
  end
end
