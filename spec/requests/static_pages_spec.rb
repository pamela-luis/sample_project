require 'spec_helper'

describe "StaticPages" do

  let(:special_title) { "" }
  let(:base_title) { "Ruby on Rails Tutorial Sample App#{special_title}" }

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: base_title) }
    it { should have_content(heading) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
  end
  describe "Home page" do
    let(:special_title) { "" }
    let(:heading) { 'Sample App' }

    before { visit root_path }

    it_should_behave_like "all static pages"
    it { should_not have_selector('title', :text => '| Home') }
  end

  describe "Help page" do
    let(:special_title) { ' | Help' }
    let(:heading) { 'Help' }

    before { visit help_path }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    let(:special_title) { ' | About Us' }
    let(:heading) { 'About Us' }

    before { visit about_path }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    let(:special_title) { ' | Contacts' }
    let(:heading) { 'Contact' }
    before { visit contact_path }

    it_should_behave_like "all static pages"
  end

end
