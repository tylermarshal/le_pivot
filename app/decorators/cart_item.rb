class CartItem < SimpleDelegator

  attr_accessor :quantity

  def initialize(item, quantity)
    super(item)
    @quantity = quantity
  end

  def total_cost
    price * quantity
  end

end