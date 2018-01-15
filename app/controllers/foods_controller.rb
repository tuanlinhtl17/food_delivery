class FoodsController < ApplicationController
  def show
    @food = Food.find params[:id]
    @foods = Food.all
    redirect_to root_url unless @food
    @comment_foods = @food.comment_foods.all
  end

  def index
    @foods = Food.search params[:search]
  end

  def create
    if current_user.admin?
      @food = Food.new(food_params)
      if @food.save
        flash[:success] = t("views.foods.new.success")
        redirect_to @food
      else
        render "_new"
      end
    else
      flash[:danger] = t("views.foods.new.danger")
      redirect_to root_url
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :img_url, :price, :user_id, :food_category_id)
    end
end
