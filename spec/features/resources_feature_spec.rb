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

    context "invalid resource" do
      scenario "name is too short" do
        visit "/resources"
        click_link "Add a resource"
        fill_in "Name", with: "on"
        click_button "Create Resource"
        expect(page).not_to have_css 'h2', text: 'on'
        expect(page).to have_content 'error'
      end
    end

  end


  context "viewing resources" do
    let!(:moon) { Resource.create(name: "moon") }

    scenario "lets a user view a resource" do
      visit "/resources"
      click_link "moon"
      expect(page).to have_content "moon"
      expect(current_path).to eq "/resources/#{moon.id}"
    end
  end

  context "editing resources" do

    before { Resource.create(name: "moon") }

    scenario "let a user edit a resource" do
      visit "/resources"
      click_link "Edit moon"
      fill_in "Name", with: "hello moon moon"
      click_button "Update Resource"
      expect(page).to have_content "hello moon moon"
      expect(current_path).to eq "/resources"
    end
  end

  context "deleting resources" do

    before { Resource.create name: "mooon" }

    scenario "removes a resource when delete link is clicked" do
      visit "/resources"
      click_link "Delete mooon"
      expect(page).not_to have_content "mooon"
      expect(page).to have_content "Resource deleted successfully"
    end
  end

end
