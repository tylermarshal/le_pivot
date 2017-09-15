# Background: An existing user and a cart with items
#
# As a visitor
# When I add items to my cart
# And I visit “/cart”
# And I click “Login or Register to Checkout”
# Then I should be required to login
#
# When I am logged in
# And I visit my cart
# And when I click “Checkout”
# Then the order should be placed
# And my current page should be “/orders”
# And I should see a message “Order was successfully placed”
# And I should see the order
# I just placed in a table

require 'rails_helper'

RSpec.feature "User can place an order" do
  it "and see the message 'order was successfully placed'" do
    create_items

    visit items_path

    click_on "Add to Cart"

    visit cart_path

    click_on "Login"

    click_on "Cart"

    click_on "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(@item.title)
  end
end
