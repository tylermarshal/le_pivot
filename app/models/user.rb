class User < ApplicationRecord
  has_secure_password
  has_many :orders

  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :user_stores
  has_many :stores, through: :user_stores

  has_one :developer

  validates :first_name, :last_name, presence: true
  validates :password, presence: true, allow_nil: true
  validates :email, presence: true, uniqueness: true


  def registered_user?
    roles.exists?(title: "registered_user")
  end

  def store_admin?
    roles.exists?(title: "store_admin")
  end

  def platform_admin?
    roles.exists?(title: "platform_admin")
  end

  def store_manager?
    roles.exists?(title: "store_manager")
  end

  def has_store_access?(action,store_params)
    if action == "update"
      store_params = Store.find(store_params).slug
    end
    available_stores = stores.map {|store| store.slug}
    available_stores.include?(store_params)
  end

  def full_name
    first_name + " " + last_name
  end

  def date_joined
    created_at.strftime('%b. %d, %Y')
  end

  def self.user_orders
    group(:email).joins(:orders).count
  end

  def self.user_quantity_of_items_ordered
    group(:email).joins(orders: :order_items).sum(:quantity)
  end
end
