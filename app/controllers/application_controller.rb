class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_authentication

  protected

  def require_authentication
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end

  def require_admin
    unless current_user.try(:admin?)
      redirect_to root_path
    end
  end
end
