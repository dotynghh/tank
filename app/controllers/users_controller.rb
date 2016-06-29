class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_attr)
		@user.active_code = @user.newrandom(64)

		if @user.save
				byebug
				flash[:notice] = "注册成功，请登录"
				Usermailer.signup(@user).deliver_now
				redirect_to new_session_path

		else
			flash[:notice] = "注册失败,请重新注册"
			render action: :new
		end
	end

	def user_active
		@user = User.find_by(active_code: params[:id])
		byebug
		unless @user == nil
			if @user.active_code == params[:id]
				@user.is_active = true
				@user.save
				flash[:notice] = "激活成功，请登录"
				redirect_to new_session_path
			elsif @user.is_active == true
				flash[:notice] = "已激活，请勿重新激活"
      	redirect_to new_session_path
    	else
    		flash[:notice] = "激活失败"
      	render action: :new
			end
		end
	end

	private

	def user_attr
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
