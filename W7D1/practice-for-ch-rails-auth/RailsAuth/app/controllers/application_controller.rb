class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  skip_before_action :verify_authenticity_token
  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end

  def current_user
    # debugger
    return nil unless session[:session_token]

    @current_user ||= User.find_by(session_token: session[:session_token])
    # debugger
  end

  def logged_in?
    # debugger
    !!current_user
  end

  def require_logged_in
    # debugger
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to users_url if logged_in?
  end
end
