require 'net/http'
require 'json'

class Gif < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.retrieve_gif(category)
    url = "https://api.giphy.com/v1/gifs/random?api_key=hGzNRmDn8ub1AYqUQXmqTgjXR8MHWY5f&tag=#{category}&rating=G"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    result
  end

  def self.sort_by_category
    joins(:category).order("categories.name")
  end
end
