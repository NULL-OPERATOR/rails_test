require "rails_helper"

feature "resources" do
  context "none have been added" do
    scenario "should display a prompt to add one" do
      visit "/resources"
      expect(page).to have_content "No resources yet"
      expect(page).to have_link "Add a resource"
    end
  end

  context "have been added" do
    before do
      Resource.create(name: "Moon")
    end

    scenario "display restaurants" do
      visit "/resources"
      expect(page).to have_content "Moon"
      expect(page).not_to have_content "No resources yet"
    end
  end

  context "creating resources" do
    scenario "prompts users to fill in a form" do
      visit "/resources"
      click_link "Add a resource"
      expect(current_path).to eq "/resources/new"
      fill_in "Name", with: "Moon"
      click_button "Create Resource"
      expect(page).to have_content "Moon"
      expect(current_path).to eq "/resources"
    end
  end
end
