class StaticPagesController < ApplicationController
  def home
    @foods = Food.all
  end

  def search
    if params[:search]
      @foods = Food.search params[:search]
      if !@foods
        flash[:warning] = t("views.static_pages.search.nomatch")
        redirect_to root_url
      else
        render :partial => "static_pages/show_all_foods"
      end
    end
  end
end
