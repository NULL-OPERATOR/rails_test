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
    before do
      visit "/"
      click_link("Sign up")
      fill_in("Email", with: 'im@nowhere.cr')
      fill_in("Password", with: 'testss12')
      fill_in("Password confirmation", with: 'testss12')
      click_button("Sign up")
    end

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
