require 'rails_helper'

describe "validations" do
  describe "invalid attributes" do
    it "invalid wihtout a category reference" do
      gif = Gif.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      expect(gif).to be_invalid
    end

    it "is invalid without a url" do
      category = Category.create(name: "Puppy")
      category.gifs.create

      expect(category).to be_invalid
    end

    it "is invalid without a unique url" do
      category = Category.create(name: "Puppy")
      category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      expect(gif).to be_invalid
    end
  end

  describe "valid attributes" do
    it "is valid with valid attributes" do
      category = Category.create(name: "Puppy")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      expect(gif).to be_valid
    end
  end

  describe "relationships" do
    it "belongs to category" do
      category = Category.create(name: "Puppy")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      expect(gif).to respond_to(:category)
    end
    it "has many favorites" do
      category = Category.create(name: "Puppy")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      expect(gif).to respond_to(:favorites)
    end
    it "has many users" do
      category = Category.create(name: "Puppy")
      gif = category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      expect(gif).to respond_to(:users)
    end
  end
end
