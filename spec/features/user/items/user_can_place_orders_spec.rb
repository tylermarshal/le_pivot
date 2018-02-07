require 'rails_helper'

RSpec.feature "User can place an order" do
  before(:each) do
    @category = Category.create(title: "Cats")
    @item = @category.items.create(title: "Black Cat Onesie",
                                   description: "The best cat onesie you'll ever find",
                                   price: 19.99,
                                   image: "https://images-na.ssl-images-amazon.com/images/I/41CFHIae7TL._SL500_.jpg")
    User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
  end
  it "and see the message 'order was successfully placed'" do

    visit items_path

    click_on "Add to cart"

    visit cart_path

    within(".checkout") do
      click_on("Login")
    end

    fill_in "session[email]", with: "testerson@testmail.com"
    fill_in "session[password]", with: "testing"

    within(".action") do
      click_on("Login")
    end

    click_on "Cart"
    
    click_on "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("Order was successfully placed")
  end
end
