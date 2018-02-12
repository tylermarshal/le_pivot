require 'rails_helper'


RSpec.describe 'an admin can visit admin dashboard' do
  describe 'and see a link for all items' do
    let(:admin){create(:user)}
    let(:role){create(:role, title: "platform_admin")}
    let(:item){create(:item)}
    let(:store){create(:store)}
    before :each do 
      admin.roles << role
    end
    it 'when clicked that link should be the admin item index with admin functionality' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_store_items_path(item.store.slug)
      click_on "Edit"
      fill_in "item[title]", with: "White Cat Twosie"
      fill_in "item[description]", with: "two is better"
      fill_in "item[price]", with: "39.99"
      page.attach_file("item[image]", testing_image)
      click_on "Update"

      expect(page).to have_content("White Cat Twosie")
      expect(page).to have_content("39.99")
    end
  end
end
