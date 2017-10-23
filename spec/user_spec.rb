require 'rails_helper'
  describe "validation" do
    describe "invalid attributes" do
      it "is invalid without a name" do
        user = User.new(email: "jane@email.com")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(name: "Jane")
        expect(user).to be_invalid
      end

      it "is invalid without unique email" do
        User.create(name: "Jane", email: "jane@email.com")
        user = User.create(name: "Janie", email: "jane@email.com")
        expect(user).to be_invalid
      end
    end
    describe "valide attributes" do
      it "is valid with valid attributes" do
        user = User.create(name: "Jane", email: "jane@email.com")
        expect(user).to be_valid
      end
    end
  end
