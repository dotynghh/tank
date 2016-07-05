class Admin::SessionsController < Admin::BaseController

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
      flash[:notice] = "该用户不是管理员，请与管理员联系"
      render action: :new
    end
  end
end
