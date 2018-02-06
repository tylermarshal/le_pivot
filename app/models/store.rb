# class Store < ApplicationRecord
#   has_many :items
#
#   validates_uniqueness_of :name, :slug
#
#   before_validation :generate_slug
#
#   def generate_slug
#     self.slug = name.parameterize
#   end
#
# end
