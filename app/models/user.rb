class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_secure_password

  has_many :favorites
  has_many :gifs, through: :favorites

  enum role: ["default", "admin"]

end
