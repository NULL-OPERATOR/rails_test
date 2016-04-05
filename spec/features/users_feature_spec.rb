require "rails_helper"

feature "Can sign in and out" do
  context "user not signed in and on the homepage" do
    
    it "should see a 'sign in' link and a sign up link" do
      visit "/"
      expect(page).to have_link("Sign in")
      expect(page).to have_link("Sign up")
    end

    it "should not see the sign out link" do
      visit "/"
      expect(page).not_to have_link("Sign out")
    end
  end

  context "user signed in" do

    before { sign_up }

    it "has sign out link" do
      visit "/"
      expect(page).to have_link("Sign out")
    end

    it "doesnt have sign up/in links" do
      visit "/"
      expect(page).not_to have_link("Sign in")
      expect(page).not_to have_link("Sign up")
    end

  end
end
