class ApplicationController < ActionController::Base
  include Authentication
  before_action :set_current
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def index
    if Current.user.business_user
      redirect_to "/inventories/#{Current.user.inventory.id}"
    else
      redirect_to "/inventories/#{Current.user.business.inventory.id}"
    end
  end

  private
  def set_current
    @current = Current.user
  end
end
