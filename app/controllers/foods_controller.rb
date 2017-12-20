class FoodsController < ApplicationController
  def show
    @food = Food.find params[:id]
    redirect_to root_url unless @food
  end

  def index
    @foods = Food.search params[:search]
  end
end
