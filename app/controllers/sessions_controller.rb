class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home]
  before_action :save_login_state, :only => [:create]

  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		#redirect_to user_path(user.id)
      redirect_to home_url, notice: 'Logged in!'
  	else
  		flash.now.alert = 'Invalid email or password'
  		render :new #render the login template again (new in sessions)
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
