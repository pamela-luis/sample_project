require 'spec_helper'

describe "StaticPages" do

  let(:special_title) { "" }
  let(:base_title) { "Ruby on Rails Tutorial Sample App#{special_title}" }

  describe "Home page" do
    let(:special_title) { "" }

    before { visit root_path }

    subject { page }

    it { should have_content('Sample App') }

    it { should have_selector('title', :text => full_title('')) }

    it { should have_selector('h1', :text => 'Sample App') }

    it { should_not have_selector('title', :text => '| Home') }
  end

  describe "Help page" do
    let(:special_title) { ' | Help' }

    before { visit help_path }

    subject { page }

    it { should have_content('Help') }

    it { should have_selector('title', :text => base_title) }
  end

  describe "About page" do
    let(:special_title) { ' | About Us' }

    before { visit about_path }

    subject { page }
    it { should have_content('About Us') }

    it { should have_selector('title', :text => base_title) }

  end

  describe "Contact page" do
    before { visit contact_path }

    subject { page }
    it {should have_content('contact')}

    it { should have_selector("title",
                              :text => "Ruby on Rails Tutorial Sample App | Contacts") }

    it { should have_selector('h1', text: 'Contact') }

    it { should have_selector('title',
                              text: "Ruby on Rails Tutorial Sample App") }
  end

end
