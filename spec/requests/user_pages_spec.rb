require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it {
      should have_content(user.name)
    }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup page" do
    let(:sign_up) { "Create my account" }
    before { visit signup_path }


    it { should have_content('Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }

    context "with invalid data" do
      it "should not create a user" do
        expect { click_button "Create my account" }.not_to change(User, :count)
      end
    end

    context "with valid information" do
      before do
        fill_in "Name", with: "Pamela Luis"
        fill_in "Email", with:"pamela.luis@rafter.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button sign_up }.to change(User, :count)
      end
    end
  end
end