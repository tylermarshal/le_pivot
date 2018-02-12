require 'rails_helper'

RSpec.feature "User can place an order" do
  it "and see the message 'order was successfully placed'" do
    user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    role = Role.create(title: "registered_user")
    user.roles << role
    item = create(:item)
    visit store_items_path(item.store.slug)
    
    click_on "Add to cart"
    
    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Order was successfully placed")
  end
end
