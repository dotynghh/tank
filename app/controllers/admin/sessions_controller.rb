class Admin::SessionsController < ApplicationController
  layout "admin"
  def new
    @user = User.new
  end
  def create
    @user = User.user_isadmin?(params[:username], params[:password])
    if @user
      signin_user @user
      flash[:notice] = "管理员登录成功"
      redirect_to admin_products_path
    else
      flash[:notice] = "管理员登录失败"
      render action: :new
    end
  end
end