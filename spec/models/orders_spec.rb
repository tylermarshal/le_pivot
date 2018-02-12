require 'rails_helper'

RSpec.describe Order do
  describe 'validations' do
    describe 'invalid attributes' do
      it 'is invalid without a status' do
        order = build(:order, status: nil)
        expect(order).to be_invalid
      end

    end
    describe 'valid attributes' do
      it 'is valid' do
        order = build(:order)
        expect(order).to be_valid
      end
    end
  end
  describe 'realtionships' do
    it 'belongs to a user' do
      order = build(:order)
      expect(order).to respond_to(:user)
    end

    it 'has many items' do
      item = create(:item)
      order = build(:order, items: [item])
      expect(order).to respond_to(:items)
      expect(order.items.first).to be_an(Item)
    end
  end

  describe "instance methods" do
    it "can calculate the total for an order" do
      gob = create(:user)
      order = create(:order, status: "ordered", user: gob)
      create(:category)
      item_1 = create(:item, title: "Dove", price: 10.00)
      item_2 = create(:item, title: "Seal", price: 1.00)
      order.order_items.create!(quantity: 3, item_id: item_1.id)
      order.order_items.create!(quantity: 1, item_id: item_2.id)
      create(:item, title: "Banana Stand", price: 100.00)
     
      expect(order.order_total). to eq 31.00
    end
    it "can return total price of items" do
      gob = create(:user)
      order = create(:order, status: "ordered", user: gob)
      create(:category)
      item_1 = create(:item, title: "Dove", price: 10.00)
      item_2 = create(:item, title: "Seal", price: 1.00)
      create(:item, title: "Banana Stand", price: 100.00)

      order.items << item_1
      order.items  << item_2

      expect(order.total_price).to eq(11.0)
    end

    it "can add an item" do
      user = User.create!(first_name: "Testy", last_name: "McTest", password: "testing", email: "tester@testmail")
      order = user.orders.create!(status: "ordered")
      create(:category)
      item = create(:item)
      cart_item_array = [CartItem.new(item, 1)]

      expect(order.items).to eq([])

      order.add(cart_item_array)

      expect(order.items.first).to eq(item)
    end

    it "can return the order date" do
      order = create(:order, created_at: "2017-09-13 01:13:04 -0600")

      expect(order.date).to eq("Sep. 13, 2017")
    end
  end

  describe "class methods" do
    it "can count by status" do
      create(:order, status: "ordered")
      create(:order, status: "ordered")
      create(:order, status: "paid")
      create(:order, status: "cancelled")

      status_count = {"paid"=>1, "ordered"=>2, "cancelled"=>1}

      expect(Order.count_by_status).to eq(status_count)
    end

    it "can filter by status" do
      ordered   = create(:order, status: "ordered")
      paid_1    = create(:order, status: "paid")
      paid_2    = create(:order, status: "paid")
      cancelled = create(:order, status: "cancelled")

      all_ordered   = Order.filter_by_status("ordered")
      all_paid      = Order.filter_by_status("paid")
      all_cancelled = Order.filter_by_status("cancelled")

      expect(all_ordered).to include(ordered)
      expect(all_ordered.count).to eq(1)

      expect(all_paid).to include(paid_1)
      expect(all_paid).to include(paid_2)
      expect(all_paid.count).to eq(2)

      expect(all_cancelled).to include(cancelled)
      expect(all_cancelled.count).to eq(1)
    end
  end
end
