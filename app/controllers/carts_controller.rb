class CartsController < ApplicationController

  def create
    if logged_in?
      @cart = Cart.find_or_create_by(user_id: current_user.id, food_id: params[:food_id])
    else
      @cart = Cart.find_or_create_by(session_id: request.session_options[:id], food_id: params[:food_id])
    end

    if @cart.quantity
      quantity = @cart.quantity + params[:quantity].to_i
      @cart.update_attributes(quantity: quantity)
    else
      @cart.quantity = params[:quantity]
      @cart.save
    end
    respond_to do |format|
      format.js
    end
  end

  def index
    if !current_user.nil?
      @carts = current_user.carts.all
    else
      @carts = Cart.cart_amount_session request.session_options[:id]
    end
  end

  def update
    hash = Hash.new
    params[:cart][:id].each_with_index {|item,index|
      hash[item] = {quantity: params[:cart][:quantity][index]}
    }
    Cart.transaction do
      Cart.update(hash.keys,hash.values)
      update_cart
    end
  rescue ActiveRecord::RecordInvalid => exception
      raise ActiveRecord::Rollback
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    @cart_id = params[:id]
    respond_to do |format|
      format.html {redirect_to carts_url}
      format.js
    end
  end

  private
  def update_cart
    Cart.all.each do |c|
      c.update_attributes(total_money: c.quantity * c.food.price)
    end
  end
end
