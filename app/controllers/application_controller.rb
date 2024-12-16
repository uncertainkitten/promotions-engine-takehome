class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def current_cart         
    if current_user.present?
     current_user.current_cart
    else  
      Cart.find(session[:cart_id])  
    end
    rescue ActiveRecord::RecordNotFound  
      cart = Cart.create  
      session[:cart_id] = cart.id  
      cart  
  end 
end
