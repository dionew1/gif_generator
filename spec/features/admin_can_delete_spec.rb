require 'rails_helper'

describe "Admin can delete" do
  scenario "Admin can delete a gif" do
    admin = User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = Category.create(name: "Puppy")
    category.gifs.create(url: "https://media1.giphy.com/media/830eOTPrd8bGU/giphy.gif")

    visit admin_gifs_path

    click_on "Delete"
    expect(Gif.count).to eq 0
    expect(page).not_to have_content("Puppy")
  end

  scenario "Admin can delete a category" do
    admin = User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    Category.create(name: "Puppy")

    visit admin_categories_path

    click_on "Delete"
    expect(Category.count).to eq 0
    expect(page).to have_content("Puppy has been deleted with all gifs.")
  end

  scenario "Admin can delete all gifs associated to category" do
    admin = User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = Category.create(name: "Puppy")
    category.gifs.create(url: "https://media2.giphy.com/media/l2SpQernPGHqVcjgA/giphy.gif")

    visit admin_categories_path

    click_on "Delete"
    expect(Gif.count).to eq 0
  end
end
