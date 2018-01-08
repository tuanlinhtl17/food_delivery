module SessionsHelper
  def log_in user
    session[:user_id] = user.id
    if user.user_type == 4
      Cart.cart_amount_session(request.session_options[:id]).update_all(user_id: user.id, session_id: nil)
    end
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end

  def present model
    klass = "#{model.class}Presenter".constantize
    presenter = klass.new(model).get_info
    yield(presenter) if block_given?
  end

  def cart_amount
    if logged_in?
      cart_amount = Cart.cart_amount_user(current_user.id).size
    else
      cart_amount = Cart.cart_amount_session(request.session_options[:id]).size
    end
  end

  def correct_user user
    user == current_user && logged_in?
  end
end
