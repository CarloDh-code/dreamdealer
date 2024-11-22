class User < ApplicationRecord
  has_many :dreams
  has_many :bookings
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
