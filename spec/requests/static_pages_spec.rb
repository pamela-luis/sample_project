require 'spec_helper'

describe "StaticPages" do

  let(:special_title) { "" }
  let(:base_title) { "Ruby on Rails Tutorial Sample App#{special_title}" }

  describe "Home page" do
    let(:special_title) { "" }

    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => base_title)
    end

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do
    let(:special_title) { ' | Help' }

    it "should have the content 'Help'" do
      visit "/static_pages/help"
      page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => base_title)
    end
  end

  describe "About page" do
    let(:special_title) { ' | About Us' }

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => base_title)
    end
  end

  describe "Contact page" do
    it "should have the content 'Contacts'" do
      visit '/static_pages/contact'
      page.should have_content('contact')
    end

    it "should have the title 'Contacts'" do
      visit '/static_pages/contact'
      page.should have_selector("title",
                  :text => "Ruby on Rails Tutorial Sample App | Contacts")
    end
  end

end
