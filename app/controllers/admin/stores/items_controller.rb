class Admin::Stores::ItemsController < ApplicationController

  before_action :require_admin

  def index
    @store = Store.find_by(slug: params[:store])
    @items = @store.items
  end

  def new
    @categories = Category.all
    @store = Store.find_by(slug: params[:store])
    @item = Item.new
  end

  def create
    @categories = Category.all
    @store = Store.find_by(slug: params[:store])
    @item = @store.items.new(item_params)
    if @item.save!
      redirect_to store_item_path(@item.store.slug, @item)
    else
      render :new
    end
  end

  def update
    @categories = Category.all
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to admin_store_items_path(@item.store.slug)
    else
      render :edit
    end
  end

  def edit
    @categories = Category.all
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end

  def require_admin
    render file: "/public/404" unless current_user.platform_admin? || current_user.has_store_access?(params[:action],params[:store])
  end
end
