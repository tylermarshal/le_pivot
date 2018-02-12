class OrdersController < ApplicationController
  before_action :require_current_user

  def index
    @user = current_user
    @user.orders.preload(:items)
  end

  def show
    if current_user.platform_admin? 
      @order = Order.find(params[:id])
    elsif current_user.id == params[:id].to_i
      @order = current_user.orders.find(params[:id])
    else
      not_found
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save
    redirect_back(fallback_location: root_path)
  end


  def new
    order = Order.create(status: "ordered", user_id: current_user.id)
    item_hash = @cart.contents
    order.add(item_hash)
    order.order_total
    @cart.destroy
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  private

  def require_current_user
    redirect_to login_path unless current_user
  end

  def order_params
    params.permit(:status, :user_id)
  end

end
