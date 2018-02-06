class Order < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  has_many :order_items
  has_many :items, through: :order_items

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def total_price
    items.sum(:price)
  end

  def add(item_hash)
    item_hash.each do |item, quantity|
      items << item
      order_item = OrderItem.find_by(order: self, item_id: item.id)
      order_item.update(quantity: quantity)
    end
  end

  def order_total
    items.reduce(0) do |result, item|
      result += (item.price * OrderItem.find_by(item: item.id, order: self.id).quantity)
      result
    end
  end

  def date
    created_at.strftime('%b. %d, %Y')
  end

  def self.count_by_status
    group(:status).count
  end

  def self.filter_by_status(status)
    where(status: status)
  end

  def self.count_of_completed_orders
    where(status: :completed).count
  end

  def self.shop_total_gross
    where(status: :completed).joins(:items).sum(:price)
  end

  def self.check_for_status(params)
    if params[:status]
      filter_by_status(params[:status])
    else
      all
    end
  end
end
