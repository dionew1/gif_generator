require 'rails_helper'

describe "User can visit login" do
  scenario "user can visit login" do
    visit "/login"
    expect(page).to have_content("Please Log In")
  end
end
