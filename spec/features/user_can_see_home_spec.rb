require 'rails_helper'

describe "User sees home page" do
  scenario "user can see home page" do
    visit '/'

    expect(page).to have_content("Welcome to Gif Generator!")
    expect(page).to have_content("Create an Account")
  end
end
