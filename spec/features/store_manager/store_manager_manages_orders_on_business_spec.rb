require 'rails_helper'

feature "A store manager manages orders on their business" do

  let!(:store_manager) {create(:user)}
  let!(:role)          {create(:role, title: "store_manager")}
  let!(:store)         {create(:store)}
  let!(:item_1)        {create(:item, store: store)}
  let!(:item_2)        {create(:item, store: store)}
  let!(:order_1)       {create(:order, status: "ordered")}
  let!(:order_2)       {create(:order, status: "paid")}
  let!(:order_item_1)  {create(:order_item, item: item_1, order: order_1)}
  let!(:order_item_2)  {create(:order_item, item: item_2, order: order_2)}


  before(:each) do
    store_manager.roles << role  
    store_manager.stores << store  
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_manager)
  end

  context "as a valid store manager of a business" do
    it "they can see all orders for their business" do
      visit store_orders_path(store)

      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_1.date)
      expect(page).to have_content(order_1.status.capitalize)

      expect(page).to have_content(order_2.id)
      expect(page).to have_content(order_2.date)
      expect(page).to have_content(order_2.status.capitalize)
    end

    it "they can see a single order for their business" do
      visit store_order_path(store, order_1)

      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_1.date)
      expect(page).to have_content(order_1.status.capitalize)
    end

    it "they can't see orders for a business they don't manage" do
      unowned_store = create(:store)

      expect {
        visit store_orders_path(unowned_store)
      }.to raise_error(ActionController::RoutingError)
    end

    context "they can filter orders by status" do
      it "ordered" do
      end

      it "paid" do
      end

      it "completed" do
      end

      it "cancelled" do
      end

    end

    context "they can change status" do
      context "of a paid order" do
        it "to cancelled" do
        end

        it "to completed" do
        end
      end

      context "of a ordered order" do
        it "to cancelled" do
        end

        it "to paid" do
        end
      end
    end
  end
end