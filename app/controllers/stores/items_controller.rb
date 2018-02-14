class Stores::ItemsController < ApplicationController
  def index
    @items = Store.find_by(slug: params[:store]).items
  end

  def show
    @item = Item.find(params[:id])
  end
end
