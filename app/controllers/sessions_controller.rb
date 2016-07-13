class SessionsController < ApplicationController

	def new

	end

	def create
		@user = User.user_istrue?(params[:username], params[:password])
		if @user
			session[:user_id] = @user.id
			redirect_to products_path
		else
			flash[:notice] = "please activation!"
			redirect_to :back
		end
	end

	def destroy
		logout_user
		flash[:notice] = "Exit the success."
		redirect_to root_path
	end
	
end
