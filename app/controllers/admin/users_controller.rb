class Admin::UsersController < ApplicationController
  def add_role
    user = User.find(params[:id])
    role = Role.find_or_create_by(title: params[:role])
    user.roles << role
    redirect_back(fallback_location: admin_dashboard_index_path)
  end

  def remove_role
    user = User.find(params[:id])
    user.roles.find_by(title: params[:role]).destroy
  end
end