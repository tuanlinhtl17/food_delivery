class DeliveriesController < ApplicationController
  def create
    @order = Order.find params[:order_id]
    @order.update_attributes status: 2
    respond_to do |format|
      format.js
    end
  end
end
