require 'rails_helper'

describe "Admin can create" do
  scenario "Admin can create a category" do
    admin = User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path

    fill_in "category[name]", with: "kitten"
    click_on "Generate Gif"

    expect(current_path).to eq admin_gifs_path
    expect(page).to have_content("Kitten")
    expect(Category.count).to eq 1
    expect(Gif.count).to eq 1
  end

  scenario "Admin can create a gif with existing category" do
    admin = User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path

    fill_in "category[name]", with: "kitten"
    click_on "Generate Gif"

    visit new_admin_category_path

    fill_in "category[name]", with: "kitten"
    click_on "Generate Gif"

    expect(Category.count).to eq 1
    expect(Gif.count).to eq 2
  end

end
