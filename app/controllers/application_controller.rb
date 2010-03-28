# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user_session, :current_user

  filter_parameter_logging :password, :password_confirmation
private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      unauthorized
    end
  end

  def require_manager
    forbid unless current_user.admin?
  end

  def forbid
    render :file => "#{Rails.root}/public/403.html",
           :status => 403
    false
  end

  def unauthorized
    @user_session = UserSession.new
    render :template => 'sessions/new',
           :status => 401
    false
  end
end
