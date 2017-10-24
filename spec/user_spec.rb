require 'rails_helper'
describe User do
  describe "validation" do
    describe "invalid attributes" do
      it "is invalid without a password" do
        user = User.new(username: "jane123")
        expect(user).to be_invalid
      end

      it "is invalid without an username" do
        user = User.new(password: "jane123")
        expect(user).to be_invalid
      end

      it "is invalid without unique username" do
        User.create(username: "jane123", password: "test123")
        user = User.create(username: "jane123", password: "test123")
        expect(user).to be_invalid
      end
    end

    describe "valid attributes" do
      it "is valid with valid attributes" do
        user = User.create(username: "jane123", password: "test123")
        expect(user).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has favorites" do
      user = User.create(username: "jane123", password: "test123")
      expect(user).to respond_to(:favorites)
    end

    it "has gifs" do
      user = User.create(username: "jane123", password: "test123")
      expect(user).to respond_to(:gifs)
    end
  end

  describe "role" do
    it "has default of default user" do
      user = User.create(username: "jane123", password: "test123")
      expect(user.role).to eq "default"
      expect(user.default?).to be_truthy
    end

    it "can have role of admin" do
      user = User.create(username: "jane123", password: "test123", role: 1)
      expect(user.role).to eq "admin"
      expect(user.admin?).to be_truthy
    end
  end
end
