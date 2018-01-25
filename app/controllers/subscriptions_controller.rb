class SubscriptionsController < ApplicationController
  def create
    if logged_in? && current_user.shipper?
      session[:subscription] = params["subscription"]
      subscription = Subscription.find_by user_id: current_user.id
      if subscription
        subscription.update_attributes(
          endpoint: params["subscription"]["endpoint"],
          p256dh: params["subscription"]["p256dh"],
          auth: params["subscription"]["auth"]
        )
      else
        subscription = Subscription.new
        subscription.user_id = current_user.id
        subscription.endpoint = params["subscription"]["endpoint"]
        subscription.p256dh = params["subscription"]["p256dh"]
        subscription.auth = params["subscription"]["auth"]
        subscription.save
      end      
    end
    head :ok
  end

  def destroy
    subscription = Subscription.find_by user_id: params[:user_id]
    if subscription
      subscription.destroy
    end
    head :ok
  end
end