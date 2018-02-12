require 'rails_helper'


RSpec.describe 'an admin can visit admin dashboard' do
  describe 'and see a link for all items' do
    let(:admin){create(:user)}
    let(:admin_2){create(:user)}
    let(:role){create(:role, title: "store_manager")}
    let(:item){create(:item)}
    let(:store){create(:store)}
    let(:store_2){create(:store)}
    before :each do
      admin.roles << role
      admin_2.roles << role
      store.items << item
      admin.stores << store
      admin_2.stores << store_2
    end
    it 'when clicked that link should be the admin item index with admin functionality' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_store_items_path(item.store.slug)

      click_on "Edit"
      fill_in "item[title]", with: "White Cat Twosie"
      fill_in "item[description]", with: "two is better"
      fill_in "item[price]", with: "39.99"
      click_on "Update"

      expect(page).to have_content("White Cat Twosie")
      expect(page).to have_content("39.99")
    end

    it "store manager can't access other stores items edit/new" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_2)

      visit edit_admin_store_item_path(store.slug, item)

      expect(page).to have_content("404")

      visit new_admin_store_item_path(store.slug)

      expect(page).to have_content("404")
    end
  end
end
