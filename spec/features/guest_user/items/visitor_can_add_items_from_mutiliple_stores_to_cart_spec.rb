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
  end
end
