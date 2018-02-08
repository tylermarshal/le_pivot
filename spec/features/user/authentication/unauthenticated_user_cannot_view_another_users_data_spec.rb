require 'rails_helper'

RSpec.feature "Unauthenticated users security" do
  let(:user) {create(:user, first_name: "Jake", last_name: "the Dog", email: "jake@adventuretime.com", password: "dog")}
  let(:order){create(:order, status: "ordered", user_id: user.id)}
  let(:category){create(:category, title: "uniquorn")}
  let(:item){create(:item, title: "baby uniquorn", description: "cute", price: 35.55)}
  context "As an unauthenticated user" do
    it "I cannot view another user’s private data" do
      visit dashboard_index_path

      expect(current_path).to eq(login_path)

      visit order_path(order)

      expect(current_path).to eq(login_path)
    end

    it "I should be redirected to login/create account when I try to check out" do
      visit store_item_path(item.store.slug, item)

      click_on "Add to cart"

      click_on "Cart"

      expect(page).to_not have_content("Checkout")

      visit new_order_path

      expect(current_path).to eq(login_path)
    end

    it "I cannot view the administrator screens or use administrator functionality" do
      expect {
        visit admin_dashboard_index_path
      }.to raise_exception(ActionController::RoutingError)
    end
  end
end
