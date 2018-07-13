require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before(:each) do
    @user = User.create(name: 'Abhi', email: 'abhinav@sapaad.com', address: 'my address')
  end

  scenario "Loads the index page" do
    visit users_path
    expect(page).to have_text("Users")
  end

  scenario "Creates a new User" do
    visit new_user_path

    fill_in "Name", :with => "My Name"
    fill_in "Email", :with => "my@email.com"
    fill_in "Address", :with => "my address"

    expect(page).to have_text("User was successfully created")
  end

  scenario "Edits an existing User" do
    visit edit_user_path(@user)

    fill_in "Name", :with => "My Name"
    fill_in "Email", :with => "myemail@email.com"
    fill_in "Address", :with => "my address"

    click_button "Update User"
    expect(page).to have_text("My Name")
  end

  scenario "Delete an existing User from index page" do
    visit users_path
    click_link "Delete", match: :first
    expect(page).to have_text("Users")
  end

  scenario "Delete an existing User from show page" do
    visit user_path(@user)
    click_link "Delete", match: :first
    expect(page).to have_text("Users")
  end

  scenario "Loads the show page" do
    visit user_path(@user)
    expect(page).to have_text("Abhi")
  end


end
