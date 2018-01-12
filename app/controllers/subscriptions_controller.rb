class SubscriptionsController < ApplicationController
  def create
    session[:subscription] = params[:subscription]

    head :ok
  end
end
