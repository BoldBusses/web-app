class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def current_user
    return current_school_admin || current_driver || current_guardian
  end

  protected

  def authenticate_user!
    if !school_admin_signed_in? && !driver_signed_in? && !guardian_signed_in?
      redirect_to root_url, alert: "You need to sign in before continuing"
      false
    end
  end
end
