class AddressesController < ApplicationController
	layout 'usersetting'
	before_filter :auth_user
	
	def index
		@addresses = current_user
			.addresses
			.page(params[:page] || 1)
			.per_page(params[:per_page] || 10)
			.order("id desc")
	end

	def new
		@address = Address.new
	end

	def create
		@address = current_user.addresses.new(address_attr)
		@address.province = params[:province]
		@address.city = params[:city]
		@address.country = params[:country]
		if @address.save
			flash[:notice] = "地址添加成功"
			redirect_to addresses_path
		else
			flash[:notice] = "地址添加失败"
			render action: :new
		end
	end

	def destroy
		if Address.destroy params[:id]
			flash[:notice] = "地址删除成功"
			redirect_to addresses_path
		else
			flash[:notice] = "地址删除失败"
			redirect_to :back
		end	
	end

	private

	def address_attr
		params.require(:address).permit(:consignee, :phonenumber, :description)
	end
end
