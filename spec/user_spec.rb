require 'rails_helper'
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
    describe "valide attributes" do
      it "is valid with valid attributes" do
        user = User.create(username: "jane123", password: "test123")
        expect(user).to be_valid
      end
    end
  end
