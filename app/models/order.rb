class Order < ActiveRecord::Base
	belongs_to :user

	def clone_address_ok? default_addr
		@address_backup = AddressBackup.new
		@address = Address.find default_addr
		@address_backup.user_id = @address.user_id
		@address_backup.province = @address.province
		@address_backup.city = @address.city
		@address_backup.country = @address.country
		@address_backup.description = @address.description
		@address_backup.consignee = @address.consignee
		@address_backup.phonenumber = @address.phonenumber
		if @address_backup.save
			true
		else
			false
		end
	end

	def make_orders_ok? cart, user_id, address_id, state
		self.user_id = user_id
		self.product_id = cart.product_id
		self.price = Product.find(cart.product_id).price
		self.number = cart.number
		self.counts = cart.number * Product.find(cart.product_id).price
		self.address_id = @address_backup.id
		if self.save
			state = true
		else
			state = false
		end	
	end

	def destroy_carts cart_id
		Cart.find(cart_id).destroy
	end
end

