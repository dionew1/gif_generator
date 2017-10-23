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
end
