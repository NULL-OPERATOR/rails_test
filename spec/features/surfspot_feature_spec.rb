require 'rails_helper'

feature 'Surfspots' do
  context 'none have been added' do
    scenario 'should display a prompt to add one' do
      visit '/surfspots'
      expect(page).to have_content 'No surf spots yet'
      expect(page).to have_link 'Add a surf spot'
    end
  end

  context "have been added" do
    before do
      Surfspot.create(name: 'TheCove')
    end

    scenario 'display restaurants' do
      visit '/surfspots'
      expect(page).to have_content("TheCove")
      expect(page).not_to have_content('No surf spots yet')
    end
  end

  context 'creating surfspots' do
    scenario 'prompts users to fill in a form' do
      visit '/surfspots'
      click_link 'Add a surf spot'
      fill_in 'Name', with: 'TheCove'
      click_button 'Create Surf spot'
      expect(page).to have_content 'TheCove'
      ecpect(current_path).to eq '/surfspots'
    end
  end
end
