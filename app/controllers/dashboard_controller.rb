class DashboardController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path
    else
      @user = User.find(current_user.id)
        @user.roles << Role.where(title: "registered_uer") if @user.roles.empty?
    end
  end

end
