class Admin::DashboardController < ApplicationController

  def index
    @orders = Order.check_for_status(params)
    flash[:notice] = "You're logged in as an Administrator."
  end
end
