class Admin::DashboardController < ApplicationController
  def index
    @orders = Order.check_for_status(params)
  end
end
