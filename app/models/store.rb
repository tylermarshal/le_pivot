class Store < ApplicationRecord
  has_many :items

  before_validation :generate_slug

  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  enum status: [:active, :pending, :denied]

  def generate_slug
    self.slug = name.parameterize
  end


  def approve!
  end
end
