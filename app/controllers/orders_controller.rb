class OrdersController < ApplicationController
	layout 'usersetting'

	before_filter :auth_user

	def index
    @orders = Order
      .page(params[:page] || 1)
      .per_page(params[:per_page] || 10)
      .order("id desc")
      .where(user_id: current_user.id)
      .includes(:user, :address)
	end

	def create
		if current_user.carts.blank?
			flash[:notice] = "订单创建失败,请购买商品"
			redirect_to :back
		elsif Order.carts_to_orders current_user.id 
			flash[:notice] = "订单创建成功"
			redirect_to orders_path
		else
			flash[:notice] = "订单创建失败"
			redirect_to :back	
		end	
	end

	def destroy
		@order = current_user.orders.find params[:id]
		if @order.destroy
			flash[:notice] = "删除成功"
			redirect_to orders_path
		else
			flash[:notice] = "删除失败"
			redirect_to orders_path
		end
	end
end
