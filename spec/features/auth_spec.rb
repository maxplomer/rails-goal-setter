require 'rails_helper'
require 'spec_helper'

feature "the signup process" do
  before :each do
    visit 'users/new'
  end

  it "has a new user page" do
    page.should have_content "Sign Up"
  end

  it "takes a username and password" do
    page.should have_content "Username"
    page.should have_content "Password"
  end

  it "validates the presence of the user's username" do
    fill_in('Password', :with => '123456')
    click_button('Sign Up')
    page.should have_content "Username can't be blank"
  end

  it "rejects a blank (zero-length) password" do
    fill_in('Username', :with => 'helloworld')
    fill_in('Password', :with => '')
    click_button('Sign Up')
    page.should have_content "Sign Up"
    page.should have_content 'Password is too short'
  end

  it "validates that password is at least 6 characters long" do
    fill_in('Username', :with => 'helloworld')
    fill_in('Password', :with => '12345')
    click_button('Sign Up')
    page.should have_content "Sign Up"
    page.should have_content 'Password is too short'
  end

  feature "signing up a user" do ###successful signup
    before :each do
      fill_in('Username', :with => 'helloworld')
      fill_in('Password', :with => '123456')
      click_button('Sign Up')
    end

    it "shows username on the homepage after signup" do
      page.should have_content "helloworld"
    end

    it "logs in user and redirects to goals index" do
      page.should have_content "Goals"
    end

  end

end

feature "logging in" do

  before :each do
    sign_up_with_helloworld
  end

  it "shows username on the homepage after login" do
    page.should have_content "helloworld"
    page.should have_content "Goals"
  end

end

feature "logging out" do

  before :each do
    visit "users/new"
  end

  it "begins with logged out state" do
    expect(page).to have_content "Sign In"
    page.should have_content "Sign Up"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_with_helloworld
    click_button('Sign Out')
    page.should have_content "Sign In"
    page.should have_content "Sign Up"
  end

end

end