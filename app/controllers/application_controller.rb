class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # Checks if a user is logged in
  def logged_in?
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?

  # Checks if the user_id session is avaiable. If so, assigns the user object to the @current_user and returns true
  def authenticate_user
  	if session[:user_id]
  		# set current user object to @current_user object variable
  		@current_user = User.find session[:user_id]
  		return true
  	else
  		redirect_to login_path
  		return false
  	end
  end

  # Prevents the user from accessing the signup and login pages while logged in
  def save_login_state
  	if session[:user_id]
  		redirect_to(:controller => 'home', :action => 'index')
  		return false
  	end
  end
end
