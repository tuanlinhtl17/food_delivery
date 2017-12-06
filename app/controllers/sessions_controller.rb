class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to current_user
    end
  end

  def create
   @user = User.find_by(username: params[:session][:username])
   if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_to @user
   else
      render :new
   end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
