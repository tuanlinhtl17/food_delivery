class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forge
        t(user)
        redirect_to user
      else
        message  = t("controllers.sessions.create.message1")
        message += t("controllers.sessions.create.message2")
        flash[:warning] = message
        redirect_to user
      end
    else
      flash.now[:danger] = t("controllers.sessions.create.danger")
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
