require "rails_helper"

feature "commenting a resource" do
  # before { Resource.create name: "Moon" }
  before do
    visit "/resources"
    click_link 'Add a resource'
    fill_in 'Name', with: 'Moon'
    click_button 'Create Resource'
  end

  scenario "allows users to leave a comment" do
    visit "/resources"
    click_link "Add comment for Moon"
    # fill_in "Info", with: "YUSSS"
    select "5", from: "Rating"
    click_button "Post comment"

    expect(current_path).to eq "/resources"
    # expect(page).to have_content("YUSSS")
  end
end
