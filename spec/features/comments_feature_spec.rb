require "rails_helper"

feature "commenting a resource" do
  before { Resource.create name: "Moon" }

  scenario "allows users to leave a comment" do
    visit "/resources"
    click_link "Add a comment"
    fill_in "Comment", with: "YUSSS"
    select "5", from: "Rating"
    click_button "Post comment"

    expect(current_path).to eq "/resources"
    ecpect(page).to have_content("YUSSS")
  end
end
