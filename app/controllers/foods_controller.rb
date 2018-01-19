class FoodsController < ApplicationController
  def show
    @food = Food.find params[:id]
    redirect_to root_url unless @food
    @comments = Comment.food_comment params[:id]
    @comment = Comment.new
    @picture = @comment.pictures.build
    @pictures = Picture.all_food_comment_picture params[:id]
  end

  def index
    @foods = Food.all
  end

  def destroy
    if current_user.admin?
      @food = Food.find(params[:id])
      @food.destroy
      respond_to do |format|
        format.js
      end
    end
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

  def update
    if current_user.admin?
      @food = Food.find_by params[:id]
      if @food.update_attributes(food_params)
        flash[:success] = t("views.foods.update.success")
        redirect_to @food
      else
        render "edit"
      end
    else
      flash[:danger] = t("views.foods.update.danger")
      redirect_to root_url
    end
  end

  private
    def food_params
      params.require(:food).permit(:name, :img_url, :price, :user_id, :food_category_id)
    end
end
