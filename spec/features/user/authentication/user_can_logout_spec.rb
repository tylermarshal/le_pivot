 require 'rails_helper'

RSpec.describe "As a visitor I can login" do
  before :each do
    6.times do create(:store)
    end
  end
  it "as a user I can log out" do
    user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    role = Role.create(title: "registered_user")
    user.roles << role
    visit '/'
    click_on 'Login'
    fill_in "session[email]", with: "testerson@testmail.com"
    fill_in "session[password]", with: "testing"

    within(".login-path") do
      click_on("Login")
    end
    click_on 'Logout'
    expect(page).to have_content("Login")

  end

end
