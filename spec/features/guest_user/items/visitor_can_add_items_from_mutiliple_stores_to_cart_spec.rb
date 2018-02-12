RSpec.feature "Adding items to the cart" do
  xit "can visit one store" do
    store1 = create(:store, name: "Plants")
    store2 = create(:store, name: "Books")
    create(:item, title: "Dove", store: store1)
    create(:item, title: "Light Saber", store: store2)

    visit '/stores'

    within(".stores") do
      expect(page).to have_content("Plants")
      expect(page).to have_content("Books")
    end
  end
end
