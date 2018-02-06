require "rails_helper"

describe "As a logged in user" do
  describe "when I visit '/account/edit'" do
    describe "And I change my First Name to 'George Oscar Bluth'" do
      describe "And I don't enter a password to edit my other data" do
        describe "And I click 'Submit'" do
          it "should be on '/account/edit'" do
            user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

            login_user(user.email, "testing")

            click_on "Edit Account"
            expect(current_path).to eq("/account/edit")
            fill_in "user[first_name]", with: "George Oscar Bluth"
            click_on "Submit"

            expect(current_path).to eq("/account/edit")
            expect(page).to have_content("Successfully updated your account information.")
          end
        end
      end
    end
  end
end
