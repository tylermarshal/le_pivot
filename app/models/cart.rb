class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = to_cart_items(initial_contents)
  end

  def to_cart_items(initial_contents)
    if initial_contents.nil?
      @contents = []
    elsif initial_contents.class == Array
      @contents = []
      @contents << CartItem.new(Item.new(initial_contents.first), 1)
    else
      initial_contents.inject([]) do |result, (item_id, quantity)|
        result << CartItem.new(Item.find(item_id), quantity)
        result
      end 
    end
  end

  def to_cart_item(id)
    @contents << CartItem.new(Item.find(id), 1)
  end

  def total_count
    contents.reduce(0) do |sum, cart_item|
      sum + cart_item.quantity
    end
  end

  # def total_cost
  #   sum = 0
  #   @cart_items.each do |cart_item|
  #     sum += (cart_item.cost)
  #   end
  # end

  def add_item(id)
    if check_item_exists(id).count > 0
      contents.each do |cart_item|
        cart_item.quantity += 1 if cart_item.id == id
      end
    else
      to_cart_item(id)
    end
  end

  def check_item_exists(id)
    contents.select do |cart_item|
      cart_item.id == id
    end
  end

  def decrease_quantity(id)
    contents.each do |cart_item|
      check_item_quantity(cart_item) if cart_item.id == id 
    end
  end

  def check_item_quantity(cart_item)
    if cart_item.quantity > 1
      cart_item.quantity -= 1
    else
      contents.delete(cart_item)
    end
  end

  def increase_quantity(id)
    contents.each do |cart_item|
      cart_item.quantity += 1 if cart_item.id == id 
    end
  end

  def count_of(id)
    contents.each do |cart_item|
      return cart_item.quantity if cart_item.id == id
    end
  end

  # def cart_items
  #   contents.inject([]) do |result, (item_id, quantity)|
  #     result << CartItem.new(Item.find(item_id), quantity)
  #     result
  #   end
  # end

  def delete_item(id)
    contents.each do |cart_item|
       contents.delete(cart_item) if cart_item.id == id
    end
  end

  def destroy
    @contents.clear
  end

end
