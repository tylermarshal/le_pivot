class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    user.roles << Role.where(title: "registered_user")
    flash[:notice] = "Logged in as #{user.first_name} #{user.last_name}"
    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      render file: "/public/404"
    end
  end

  def update 
    if current_user.platform_admin? && current_user.id == params[:id].to_i
      current_user.update(user_params)
      redirect_to admin_dashboard_index_path
    elsif current_user != nil && current_user.id == params[:id].to_i
      current_user.update(user_params)
      flash[:notice] = "Successfully updated your account information."
      redirect_to dashboard_index_path
    else
      flash[:failure] = "Update unsuccessful, please try again."
      render file: "/public/404"
    end
  end

  def show
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = User.find(params[:id])
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :address)
    end

end
