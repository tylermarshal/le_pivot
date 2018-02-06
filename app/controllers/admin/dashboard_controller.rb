class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @orders = Order.check_for_status(params)
    flash[:notice] = "You're logged in as an Administrator."
  end
end
