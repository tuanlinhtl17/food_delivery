class OrdersController < ApplicationController
  def index
    if logged_in?
      if current_user.shipper?
        if params[:orders].present?
          if params[:orders] == "inprogress"
            @orders = Order.inprogress
          elsif params[:orders] == "new"
            @orders = Order.new_order
          elsif params[:orders] == "done"
            @orders = Order.done
          end
        else
          @orders = Order.all
        end
      else
        @orders = Order.ordered_by(current_user.id).includes(:order_details)
      end      
    else
      flash[:danger] = t "views.orders.danger"
      redirect_to root_path
    end

  end

  def show
    @order = Order.find params[:id]
  end

  def new
    @order = Order.new
  end
end
