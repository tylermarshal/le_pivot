require 'rails_helper'

RSpec.describe 'As a visitor' do
	describe 'when visiting an items show page' do
		it 'a user cannot see add to cart for a retired item' do
			item = create(:item, condition: 'retired')
			
			visit store_item_path(item.store.slug, item)
			
			expect(page).not_to have_content("Add to cart")
		end
	end
end