class DeveloperController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path
    else
      @user = User.find(current_user.id)
        @user.roles << Role.where(title: "registered_uer") if @user.roles.empty?
    end
  end

  def create
    Developer.create(user: current_user)
    redirect_to developer_path
  end

end
