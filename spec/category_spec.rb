require 'rails_helper'
describe "validations" do
  describe "invalid attributes" do
    it "is invalid without a name" do
      category = Category.new
      expect(category).to be_invalid
    end

    it "is invalid without a unique name" do
      Category.create(name: "Kittens")
      category = Category.create(name: "Kittens")
      expect(category).to be_invalid
    end
  end

  describe "valid attributes" do
    it "is valid with unique name" do
      Category.create(name: "Kittens")
      category = Category.create(name: "Puppies")
      expect(category).to be_valid
    end
  end

  describe "relationships" do
    it "has many gifs" do
      category = Category.create(name: "Kittens")
      expect(category).to respond_to(:gifs)
    end
  end

  describe "instance methods" do
    it "can have gif count" do
      category = Category.create(name: "Puppy")
      category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")

      count = category.gif_count

      expect(count).to eq 1
    end
  end
end
