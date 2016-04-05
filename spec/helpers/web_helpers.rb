def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "Email", with: '123@234.com'
  fill_in "Password", with: "12345678"
  fill_in "Password confirmation", with: "12345678"
  click_button "Sign up"
end

def add_resource(args = {})
  visit "/"
  click_link 'Add a resource'
  fill_in 'Name', with: args[:name] || "Moon"
  click_button 'Create Resource'
end
