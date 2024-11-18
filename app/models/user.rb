class User < ApplicationRecord
  has_many :dreams
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
