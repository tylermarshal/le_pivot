class ItemSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id, :title, :description, :price

  def price
    "$#{number_with_precision(object.price, precision: 2)}"
  end
end
