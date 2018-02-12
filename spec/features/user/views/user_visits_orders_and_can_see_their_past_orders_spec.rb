require 'rails_helper'

describe "As a user" do
  describe "visits /orders" do
    let(:user){create(:user)}
    let(:order_1) {create(:order, user_id: user.id)}
    it "can see all past orders" do
      user.roles << create(:role)
      item = create(:item, price: 5.00)
      OrderItem.create(order_id: order_1.id, item_id: item.id, quantity: 1)
      OrderItem.create(order_id: order_1.id, item_id: item.id, quantity: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/orders'

      expect(page).to have_css(".order", count: 1)

      within("#order-#{order_1.id}") do
        expect(page).to have_content(order_1.id)
        expect(page).to have_content(order_1.status.capitalize)
        expect(page).to have_content("$10.00")
      end
    end
  end
end
