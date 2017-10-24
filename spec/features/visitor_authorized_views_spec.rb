require 'rails_helper'

describe "Visitor can see home" do
  scenario "visitor visits home" do
    visit root_path

    expect(page).to have_content "Welcome to Gif Generator"
  end

  scenario "visitor can see new account page" do
    visit new_user_path

    expect(page).to have_content "Please enter the information below to create an account"
  end

  scenario "visitor can see login" do
    visit login_path

    expect(page).to have_content "Please Log In"
  end

  scenario "vistor cannot see user show page" do
    user = User.create(username: "jane123", password: "password123")
    visit user_path(user)

    expect(current_path).to eq root_path
  end
end
