require 'rails_helper'

describe "As a visitor can visit different stores" do
  it "can show each stores items" do
    store = create(:store, name: "Plants")
    store2 = create(:store, name: "Candles")
    category = create(:category, title: "Plants")
    create(:item, title: "Dove", store: store, category: category)
    category1 = create(:category, title: "Candles")
    create(:item, title: "Light Saber", store: store2, category: category1)

    visit "/plants"
    expect(page).to have_content("Dove")

    visit "/candles"
    expect(page).to have_content("Light Saber")
  end
end
