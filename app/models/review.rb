class Review < ApplicationRecord
  belongs_to :dream

  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :comment, presence: true
end
