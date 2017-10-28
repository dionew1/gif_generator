require 'rails_helper'

describe "User can visit login" do
  scenario "user can visit login" do
    visit "/login"
    expect(page).to have_content("Please Log In")
  end

  scenario "user can login" do
    user = User.create(username: "fun123", password: "password123")
    category = Category.create(name: "puppy")
    gif = category.gifs.create(url: "https://media0.giphy.com/media/l3q2vD9j8XhSSIjYI/giphy.gif")
    favorite = gif.favorites.create(user: user)
    visit "/login"

    fill_in "sessions[username]", with: user.username
    fill_in "sessions[password]", with: user.password

    click_on "Log In"

    expect(current_path).to eq favorites_path
    expect(page).to have_content("fun123's Favorites")
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
