require 'rails_helper'

feature "A store manager manages orders on their business" do

  let!(:store_manager)    {create(:user)}
  let!(:role)             {create(:role, title: "store_manager")}
  let!(:store)            {create(:store)}
  let!(:item_1)           {create(:item, store: store)}
  let!(:item_2)           {create(:item, store: store)}
  let!(:ordered_order)    {create(:order, status: "ordered")}
  let!(:paid_order)       {create(:order, status: "paid")}
  let!(:completed_order)  {create(:order, status: "completed")}
  let!(:cancelled_order)  {create(:order, status: "cancelled")}
  let!(:order_item_1)     {create(:order_item, item: item_1, order: ordered_order)}
  let!(:order_item_2)     {create(:order_item, item: item_2, order: paid_order)}
  let!(:order_item_3)     {create(:order_item, item: item_2, order: completed_order)}
  let!(:order_item_4)     {create(:order_item, item: item_2, order: cancelled_order)}


  before(:each) do
    store_manager.roles << role  
    store_manager.stores << store  
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_manager)
  end

  context "as a valid store manager of a business" do
    it "they can see all orders for their business" do
      visit store_orders_path(store)

      expect(page).to have_content(ordered_order.id)
      expect(page).to have_content(ordered_order.date)
      expect(page).to have_content(ordered_order.status.capitalize)

      expect(page).to have_content(paid_order.id)
      expect(page).to have_content(paid_order.date)
      expect(page).to have_content(paid_order.status.capitalize)
    end

    it "they can see a single order for their business" do
      visit store_order_path(store, ordered_order)

      expect(page).to have_content(ordered_order.id)
      expect(page).to have_content(ordered_order.date)
      expect(page).to have_content(ordered_order.status.capitalize)
    end

    it "they can't see orders for a business they don't manage" do
      unowned_store = create(:store)

      expect {
        visit store_orders_path(unowned_store)
      }.to raise_error(ActionController::RoutingError)
    end
  end

  context "they can filter orders by status" do
    before(:each) do
      visit store_orders_path(store)
    end

    it "ordered" do
      click_on("Ordered")

      expect(current_path).to eq store_orders_path(store)
      expect(page).to have_link ordered_order.id, href: order_path(ordered_order)
      expect(page).not_to have_link paid_order.id
    end

    it "paid" do
      click_on("Paid")

      expect(current_path).to eq store_orders_path(store)
      expect(page).to have_link paid_order.id, href: order_path(paid_order)
      expect(page).not_to have_link ordered_order.id
    end

    it "completed" do
      click_on("Completed")

      expect(current_path).to eq store_orders_path(store)
      expect(page).to have_link completed_order.id, href: order_path(completed_order)
      expect(page).not_to have_link paid_order.id
    end

    it "cancelled" do
      click_on("Cancelled")

      expect(current_path).to eq store_orders_path(store)
      expect(page).to have_link cancelled_order.id, href: order_path(cancelled_order)
      expect(page).not_to have_link paid_order.id
    end
  end

  context "they can change status" do
    before(:each) do
      visit store_orders_path(store)
    end

    context "of a paid order" do
      xit "to cancelled" do
        within(".order-#{paid_order.id}") do
          expect(page).to have_content("Paid")

          click_on("Cancel")

          expect(page).not_to have_content("Paid")
        end
      end

      it "to completed" do
        within(".order-#{paid_order.id}") do
          expect(page).to have_content("Paid")

          click_on("Completed")

          expect(page).to have_content("Completed")
        end
      end
    end

    context "of a ordered order" do
      xit "to cancelled" do
         within(".order-#{ordered_order.id}") do
          expect(page).to have_content("Ordered")

          click_on("Cancel")

          expect(page).to have_content("Cancelled")
        end
      end

      it "to paid" do
        within(".order-#{ordered_order.id}") do
          expect(page).to have_content("Ordered")

          click_on("Paid")

          expect(page).to have_content("Paid")
        end
      end
    end
  end
end