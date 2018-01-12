class PushNotificationsController < ApplicationController
  def create
    Webpush.payload_send webpush_params if current_user.shipper?

    head :ok
  end

  private

  def webpush_params
    subscription_params = session[:subscription]
    # byebug
    message = "Hello world, the time is #{Time.zone.now}"
    endpoint = subscription_params["endpoint"]
    p256dh = subscription_params.dig("keys", "p256dh")
    auth = subscription_params.dig("keys", "auth")
    api_key = "AIzaSyBrtH4xv8gqlhiUlc4dD3zl9jUbKrc5VGg" || ""

    { message: message, endpoint: endpoint, p256dh: p256dh, auth: auth, api_key: api_key }
  end
end
