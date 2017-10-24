require 'rails_helper'

describe "User can visit login" do
  scenario "user can visit login" do
    visit "/login"
    expect(page).to have_content("Please Log In")
  end

  scenario "user can login" do
    user = User.create(username: "fun123", password: "password123")
    visit "/login"

    fill_in "sessions[username]", with: user.username
    fill_in "sessions[password]", with: user.password

    click_on "Log In"
    
    expect(current_path).to eq user_path(user)
    expect(page).to have_content("Hello fun123!")
  end

  scenario "user denied login" do
    user = User.create(username: "fun123", password: "password123")
    visit "/login"

    fill_in "sessions[username]", with: user.username
    fill_in "sessions[password]", with: "password12"

    click_on "Log In"

    expect(current_path).to eq '/login'
    expect(page).to have_content("Please Log In")

    expect(page).to have_content("Incorrect Log In")
  end
end
