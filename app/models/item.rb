class Item < ApplicationRecord
  belongs_to :category
  belongs_to :store
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title     ,  presence: true, uniqueness: true
  validates :description, :price, presence: true
  # has_attached_file :image,
  #   styles: {thumb: "68x68#", medium: "300x300#"},
  #   default_url: "/images/missing.jpg",
  #   path: ":id/:style/:filename",
  #   storage: :cloudinary

  # validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
  enum condition: ["active", "retired"]


  def self.total_sold_by_item
    group(:title).joins(:order_items).sum(:quantity)
  end

  def self.items_by_title_with_status
    group(:title).joins(:orders).group(:status).count
  end

  def quantity(order)
     OrderItem.find_by(item: self.id, order: order.id).quantity
  end

end
