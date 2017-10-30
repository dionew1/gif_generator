require 'rails_helper'

describe "User can log out" do
  scenario "user can log out from page" do
    user = User.create(username: "user123", password: "password123")

    visit login_path

    fill_in "sessions[username]", with: "user123"
    fill_in "sessions[password]", with: "password123"

    click_on "Log In"

    click_on "Log Out"

    expect(page).to have_content "Welcome to Gif Generator"
    expect(current_path).to eq root_path
  end
end
