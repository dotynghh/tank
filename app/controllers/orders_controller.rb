class OrdersController < ApplicationController
	layout 'usersetting'

	before_filter :auth_user

	def index
    @orders = current_user.orders
      .page(params[:page] || 1)
      .per_page(params[:per_page] || 10)
      .order("id desc")	
	end

	def create
		state = true
		current_user.carts.each do | cart |
			@order = Order.new
			@order.make_orders_ok? cart, current_user.id, @order.clone_address_ok?(current_user.default_addr.to_i), state
			if state
				@order.destroy_carts cart.id
			else
				break
			end
		end
		if state
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
