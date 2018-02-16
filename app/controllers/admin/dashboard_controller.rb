class Admin::DashboardController < ApplicationController
  def index
    if current_user.platform_admin?
      @orders = Order.check_for_status(params)
    else
      @orders = current_user.stores.orders
    end
  end
end
