class Item < ApplicationRecord
  belongs_to :category
  belongs_to :store
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  validates :title     ,  presence: true, uniqueness: true
  validates :description, :price, presence: true
  has_attached_file :image,
    default_url: "/images/missing.jpg",
    path: ":id/:filename",
    keep_old_files: true,
    storage: :cloudinary,
    overwrite: true,
    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml")

  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
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
