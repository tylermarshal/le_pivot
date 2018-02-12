require 'rails_helper'

RSpec.feature "Store manager item creation" do
  context "As an authenticated store manager" do
    let(:admin){create(:user)}
    let(:role){create(:role, title: "store_manager")}
    let(:item){create(:item)}
    let(:store){create(:store)}
    let(:store_2){create(:store)}
    let(:admin_2){create(:user)}
    before :each do
      admin.roles << role
      admin.stores << store
      admin_2.roles << role
      admin_2.stores << store_2
    end
    it "I can create an item" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_store_items_path(item.store.slug)
      click_on "Create New Item"
      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      page.attach_file("item[image]", testing_image)

      click_on "Create Item"

      item_2 = Item.last

      expect(current_path).to eq(store_item_path(item_2.store.slug, item_2))
      expect(page).to have_content("Onesie")
      expect(page).to have_content("59.99")
    end
    it "store manager can't access other stores items" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_2)

      visit admin_store_items_path(store.slug)

      expect(page).to have_content("404")
    end
  end
end
