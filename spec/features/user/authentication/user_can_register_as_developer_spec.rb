require 'rails_helper'

describe "a logged in user visits their dashboard" do
  it "a user registers as a developer" do
    user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    role = Role.create(title: "registered_user")

    user.roles << role

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    within(".footer") do
      click_on "Developer Settings"
    end
    expect(current_path).to eq ("/settings/developer")

    click_on "Register"

    expect(current_path).to eq ("/settings/developer")

    expect(page).to have_css(".api_key")

    expect(user.developer.api_key).to_not be_empty
  end
end
