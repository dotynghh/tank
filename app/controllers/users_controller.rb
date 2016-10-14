class UsersController < ApplicationController

	layout "usersetting"

	def show
		@user = current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_attr)
		@user.active_code = @user.newrandom(8)
		@user.default_addr = 'q'
		if @user.save
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

		unless @user.blank?
			if @user.is_active?
				flash[:notice] = "已激活，请勿重新激活"
      	redirect_to new_session_path
			else
				@user.is_active = true
				@user.save
				flash[:notice] = "激活成功，请登录"
				redirect_to new_session_path
			end
		else
  		flash[:notice] = "激活失败"
    	redirect_to new_user_path
		end

	end

	private

	def user_attr
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
