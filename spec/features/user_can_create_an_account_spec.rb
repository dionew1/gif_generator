require 'rails_helper'

describe "User can create an account" do
  scenario "user creates an account" do
    visit new_user_path

    fill_in 'user[username]', with: "user123"
    fill_in 'user[password]', with: "password123"

    click_on "Create Account"

    expect(current_path).to eq gifs_path
  end
end
