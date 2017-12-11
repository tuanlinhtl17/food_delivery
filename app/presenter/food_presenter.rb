class FoodPresenter
  def initialize food
    @obj = ObjectPresenter.new(food.id, food.class.name, food.img_url, food.name, "$#{food.price}", food.user_id)
  end

  def get_info
    @obj
  end
end