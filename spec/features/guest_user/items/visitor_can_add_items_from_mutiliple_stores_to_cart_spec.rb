<<<<<<< HEAD
require 'rails_helper'

describe "As a visitor can visit different stores and add items to the cart" do
  it "can visit one store first and add items to the cart" do
    store1 = create(:store, name: "Plants")
    category = create(:category, title: "Plants")
    create(:item, title: "Dove", store: store1, category: category)

    visit '/plants'

    expect(page).to have_content("Dove")
    click_on "Add to cart"
    expect(page).to have_content("You now have 1 Dove")
  end

  it "can visit a second store and add items to the cart" do
    store2 = create(:store, name: "Candles")
    category1 = create(:category, title: "Candles")
    create(:item, title: "Light Saber", store: store2, category: category1)

    visit '/candles'
    expect(page).to have_content("Light Saber")
    click_link "Add to cart"
    expect(page).to have_content("You now have 1 Light Saber")
    click_on "Cart"
    expect(page).to have_content("Light Saber", "Dove")
=======
RSpec.feature "Adding items to the cart" do
  it "can visit one store" do
    store1 = create(:store, name: "Plants")
    store2 = create(:store, name: "Books")
    create(:item, title: "Dove", store: store1)
    create(:item, title: "Light Saber", store: store2)

    visit '/stores'

    within(".stores") do
      expect(page).to have_content("Plants")
      expect(page).to have_content("Books")
    end
>>>>>>> visitor tests for tickets 154944404 and 154944404"
  end
end
