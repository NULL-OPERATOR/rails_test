require "rails_helper"

feature "resources" do

  before { sign_up }

  context "none have been added" do
    scenario "should display a prompt to add one when signed in" do
      visit "/"
      expect(page).to have_content "No resources yet"
      expect(page).to have_link "Add a resource"
    end
  end

  context "have been added" do

    before { add_resource }

    scenario "display restaurants" do
      visit "/"
      expect(page).to have_content "Moon"
      expect(page).not_to have_content "No resources yet"
    end
  end

  context "creating resources" do
    scenario "prompts users to fill in a form" do
      add_resource
      expect(page).to have_content "Moon"
      expect(current_path).to eq "/resources"
    end

    context "invalid resource" do
      scenario "name is too short" do
        add_resource(name: "on")
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

  context "editing/deleting resources" do

    before { add_resource }

    scenario "let a user edit a resource" do
      visit "/"
      click_link "Edit Moon"
      fill_in "Name", with: "hello moon moon"
      click_button "Update Resource"
      expect(page).to have_content "hello moon moon"
      expect(current_path).to eq "/resources"
    end

    scenario "removes a resource when delete link is clicked" do
      visit "/"
      click_link "Delete Moon"
      expect(page).not_to have_content "Moon"
      expect(page).to have_content "Resource deleted successfully"
    end
  end

end
