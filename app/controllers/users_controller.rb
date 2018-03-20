class UsersController < ApplicationController
	before_action :save_login_state, :only => [:new, :create]
	
	def new
		@user = User.new
	end

	def show
		# params[:id] comes from the URL: /users/:id
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(allowed_params_create)
		if @user.save
			redirect_to root_url, notice: 'Thank you for signing up!'
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(allowed_params_edit)
			redirect_to @user, notice: 'Account has been updated!'
		else
			render :edit
		end
	end

	def destroy
		# Destroy current user and all dependencies
		if session[:user_id]
			@current_user = User.find session[:user_id]

			# Delete all projects created by the user
			Project.where(user_id: @current_user.id).each do |project|
				project.destroy
			end

			# Delete user and sign out
			@current_user.destroy
			session[:user_id] = nil
			redirect_to home_path
		end
	end

	# Params allowed for create a new user. Added password confirmation.
	private
	def allowed_params_create
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	# Params allowed for changing by a user
	private
	def allowed_params_edit
		params.require(:user).permit(:name, :email)
	end
end
