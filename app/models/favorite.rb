class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif

  def self.sort_by_category
    joins(gif: :category).order("name ASC")
  end
end
