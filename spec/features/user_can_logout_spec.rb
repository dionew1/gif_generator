require 'rails_helper'

describe "User can logout" do
  scenario "user can log out from show page" do
    user = User.create(username: "user123", password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit favorites_path

    click_on "Log Out"

    expect(page).to have_content "Welcome to Gif Generator"
    expect(current_path).to eq root_path
  end
end
