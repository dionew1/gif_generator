require 'rails_helper'

describe "User can favorite a gif" do
  scenario "user favorites gif from gif index" do
    user = User.create(username: "fun123", password: "password123")
    category = Category.create(name: "puppy")
    gif = category.gifs.create(url: "https://media0.giphy.com/media/l3q2vD9j8XhSSIjYI/giphy.gif")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    click_on "Add to Favorites"

    expect(page).to have_content("Your favorite has been saved")
  end

  scenario "user sees favorites on page" do
    user = User.create(username: "fun123", password: "password123")
    category = Category.create(name: "puppy")
    gif = category.gifs.create(url: "https://media0.giphy.com/media/l3q2vD9j8XhSSIjYI/giphy.gif")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    click_on "Add to Favorites"

    visit favorites_path

    expect(page).to have_content(category.name.capitalize)
  end

  scenario "user can unfavorite gif" do
    user = User.create(username: "fun123", password: "password123")
    category = Category.create(name: "puppy")
    gif = category.gifs.create(url: "https://media0.giphy.com/media/l3q2vD9j8XhSSIjYI/giphy.gif")
    gif.favorites.create(user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit favorites_path

    click_on "Unfavorite"

    expect(current_path).to eq gifs_path
    expect(page).to have_content("You currently have no favorites")
  end
end
