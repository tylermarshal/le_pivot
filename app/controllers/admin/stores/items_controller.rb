class Admin::Stores::ItemsController < ApplicationController
  before_action :require_admin
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @store = Store.find_by(slug: params[:slug])
  end

  def create
    @categories = Category.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to store_item(@item.store.slug, @item)
    else
      render :new
    end
  end

  def update
    @categories = Category.all
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
