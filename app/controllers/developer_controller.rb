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
    @developer = Developer.new(user: current_user)
    if @developer.save!
      DeveloperMailer.api_key_email(@developer.user).deliver
      flash[:notice] = "Your API key has been sent to you via email."
      redirect_to developer_path
    else
      flash[:notice] = "Something went wrong, please try registering again."
      redirect_to developer_path
    end
  end

end
