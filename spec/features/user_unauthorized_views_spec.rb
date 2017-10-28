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

    expect(status_code).to eq 404
  end
end

describe "User cannot visit" do
  it "admin new category" do
    user = User.create(username: "jane123", password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_category_path
    expect(status_code).to eq 404
  end

  it "admin categories" do
    user = User.create(username: "jane123", password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_categories_path
    expect(status_code).to eq 404
  end

  it "admin gifs" do
    user = User.create(username: "jane123", password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_gifs_path
    expect(status_code).to eq 404
  end
end
