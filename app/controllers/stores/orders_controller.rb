class Stores::OrdersController < ApplicationController
  before_action :check_store

  def index
    @store = Store.find(params[:store])
    @items = @store.items
    @orders = @items.map do |item|
      item.orders
    end.flatten
    if params[:status]
      @orders = @orders.select do |order|
        order.status == params[:status]
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def check_store
      store = Store.find(params[:store])
      not_found unless current_user.stores.include?(store)
    end
end