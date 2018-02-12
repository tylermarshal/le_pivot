require 'rails_helper'

RSpec.feature "Admin item creation" do
  context "As an authenticated admin" do
    let(:admin){create(:user)}
    let(:role){create(:role, title: "platform_admin")}
    let(:item){create(:item)}
    let(:store){create(:store)}
    before :each do 
      admin.roles << role
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
  end
end
