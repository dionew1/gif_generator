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
  describe "class methods" do
    it "can sort by category" do
      user = User.create(username: "jane123", password: "test123")
      category1 = Category.create(name: "Puppy")
      gif1 = category1.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      category2 = Category.create(name: "Pizza")
      gif2 = category2.gifs.create(url: "https://media1.giphy.com/media/xUA7aUV0jm1xc8TUS4/giphy.gif")
      favorite = Favorite.create(user: user, gif: gif1)
      favorite = Favorite.create(user: user, gif: gif2)

      sort = Favorite.sort_by_category

      expect(sort.first.gif.category.name).to eq category2.name
      expect(sort.last.gif.category.name).to eq category1.name
    end
  end
end
