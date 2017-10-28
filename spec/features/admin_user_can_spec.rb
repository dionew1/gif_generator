require 'rails_helper'

describe "Admin can visit" do
  it "admin new category" do
    admin = User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path
    expect(page).to have_content("Generate Gif")
  end

  it "admin categories" do
    admin= User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    expect(page).to have_content("Existing Categories")
  end

  it "admin gifs" do
    admin= User.create(username: "jane123", password: "password123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_gifs_path
    expect(page).to have_content("Gifs")
  end
end
