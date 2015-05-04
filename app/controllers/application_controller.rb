class ApplicationController < ActionController::Base

  helper_method :current_user

  private

  def is_connected
    if signed_in
      return
    else
      flash[:alert] = "Vous devez etre connecté pour créer un projet"
      redirect_to root_path
    end
  end

  def signed_in
    if current_user.nil?
      return false
    else
      return true
    end
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # include Pundit

  # protect_from_forgery with: :exception

  # before_action :authenticate_user!, unless: :pages_controller?

  # after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # private

  # def devise_or_pages_controller?
  #   devise_controller? || pages_controller?
  # end

  # def pages_controller?
  #   controller_name == "pages"  # Brought by the `high_voltage` gem
  # end

  # def user_not_authorized
  #   flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
  #   redirect_to(root_path)
  # end
end
