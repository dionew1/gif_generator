require 'net/http'
require 'json'

class Gif < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.retrieve_gif(category)
    key = ENV['giphy_key']
    url = "https://api.giphy.com/v1/gifs/random?api_key=#{key}&tag=#{category}&rating=G"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    if Gif.find_by(url: result["data"]["image_url"])
      byebug
      self.retrieve_gif(category)
    else
      result
    end
  end

  def self.sort_by_category
    joins(:category).order("categories.name")
  end
end
