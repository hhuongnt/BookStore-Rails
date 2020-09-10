class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number address])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_number address])
  end
end
