class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :gifs, dependent: :destroy

  def gif_count
    gifs.count
  end
end
