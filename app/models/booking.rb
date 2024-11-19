class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :dream
end
