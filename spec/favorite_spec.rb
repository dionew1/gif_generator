require 'rails_helper'

describe Favorite do
  describe "relationships" do
    it "has a relationship with gif" do
      category = Category.create(name: "Puppy")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      user = User.create(username: "jane123", password: "test123")
      favorite = Favorite.create(user: user, gif: gif)

      expect(favorite).to respond_to(:gif)
    end

    it "has a relationship with users" do
      category = Category.create(name: "Puppy")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      user = User.create(username: "jane123", password: "test123")
      favorite = Favorite.create(user: user, gif: gif)

      expect(favorite).to respond_to(:user)
    end
  end
end
