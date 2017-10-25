require 'net/http'
require 'json'

class Gif < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

end
