class Admin::Stores::ItemsController < ApplicationController
   
  def index
    @items = Item.all
    @store = Store.find_by(slug: params[:store])
  end

  def new
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
