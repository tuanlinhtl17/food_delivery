class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    @foods = Food.by_chef @user.id if @user && @user.chef?
    redirect_to root_url unless @user
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "controllers.users.register.info"
      redirect_to @user
    else
      redirect_to root_url
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    return unless correct_user @user

    if @user.update_attributes user_params
      flash[:success] = t "controllers.users.update.success"
    else
      flash[:danger] = t "controllers.users.update.errors"
    end

    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit :name, :email, :username,
                                   :password, :password_confirmation,
                                   :address, :phone_number
    end
end
