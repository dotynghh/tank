class SessionsController < ApplicationController

	def new

	end

	def create
		@user = User.user_istrue?(params[:username], params[:password])
		if @user
			session[:user_id] = @user.id
			redirect_to root_path
		else
			flash[:notice] = "please activation!"
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
