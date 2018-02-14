require 'rails_helper'

describe "Platform admin can approve new business creation" do
  it "logs in the platform admin" do
    admin = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    role = Role.create(title: "platform_admin")

    admin.roles << role

    login_user(admin.email, "testing")

    expect(current_path).to eq(admin_dashboard_index_path)
    expect(page).to have_content "Administrator"
    click_on "Manage Businesses"
    expect(current_path).to eq(admin_stores_path)
  end

  it 'shows all existing stores and their states' do
    admin = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    role = Role.create(title: "platform_admin")
    store = Store.create!(name: 'Kitten Store', status: 'pending')
    store = Store.create!(name: 'Puppy Store', status: 'active')
    store = Store.create!(name: 'Bunny Store', status: 'denied')
    admin.roles << role

    login_user(admin.email, "testing")


    expect(page).to have_content "Administrator"
    click_on "Manage Businesses"
    #within store button?
    #expect kitten store to be pending
    expect(page).to have_content("pending")
    # and it has approve and deny buttons
    expect(page).to have_content("deny")
    #expect puppy store to be active
    expect(page).to have_content("active")
    # and it has no buttons
    #expect bunny store to be denied
    # and it has no buttons
  end

  it "created store defaults to pending state" do
    admin = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    role = Role.create(title: "platform_admin")
    store = Store.create!(name: 'Kitten Store', status: 'pending')
    admin.roles << role

    login_user(admin.email, "testing")


    expect(page).to have_content "Administrator"
    click_on "Manage Businesses"
    expect(page).to have_content("Kitten Store")
    # expect it to be in pending status
    expect(page).to have_content("pending")
    # click on Approve button
    click_on "Approve"
    # expect kitten store to now have approved status
    expect(page).to have_content("approved")
  end
end
