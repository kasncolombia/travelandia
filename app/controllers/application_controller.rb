class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_user, :logged_in?, :guest_user?, :guest_mode?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def guest_user?
    session[:is_guest] == true
  end

  def guest_mode?
    guest_user? || !logged_in?
  end

  def require_login
    unless logged_in?
      flash[:alert] = "Debes estar registrado e iniciar sesión para acceder a esta sección."
      redirect_to login_path
    end
  end
end
