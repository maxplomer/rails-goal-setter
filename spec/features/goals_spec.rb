require 'rails_helper'
require 'spec_helper'

feature "The goals feature" do

  feature "when signed in" do

    before :each do
      visit "/users/new"
      sign_up_with_helloworld
      visit "/goals"
      #create_goal_with_hello_goal
    end

    it "should display goals" do
      expect(page).to have_content("Goals")
    end

    it "should be able to add goals" do
      expect(page).to have_content("Goals")
      click_link('Add Goal')
      expect(page).to have_content("New Goal")
      fill_in('Title', with: 'Start Vandelay Industries')
      choose('Public')
      click_button('Add Goal')
      expect(page).to have_content("Goals")
      expect(page).to have_content("Start Vandelay Industries")
    end

    it "should be able to edit goals"

    it "should display private goals"




  end

  feature "when signed out" do



  end

end