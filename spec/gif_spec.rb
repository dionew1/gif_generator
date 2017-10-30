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

  describe "class methods" do
    it "can sort by category" do
      category1 = Category.create(name: "Puppy")
      category1.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")
      category2 = Category.create(name: "Pizza")
      category2.gifs.create(url: "https://media1.giphy.com/media/xUA7aUV0jm1xc8TUS4/giphy.gif")

      sort = Gif.sort_by_category

      expect(sort.first.category.name).to eq(category2.name)
      expect(sort.last.category.name).to eq(category1.name)
    end

    it "can retrieve gif" do
      category = Category.create(name: "Puppy")
      gif = Gif.retrieve_gif(category.name)

      expect(gif).not_to be_nil
    end
  end
end
