class Store < ApplicationRecord
  has_many :items

  before_validation :generate_slug

  enum status: [ :online, :offline ]

  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  def generate_slug
    self.slug = name.parameterize
  end
end
