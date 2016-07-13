class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	belongs_to :address, class_name: "AddressBackup"

	def self.carts_to_orders user_id   #遍历购物车，创建订单
		user = User.find(user_id)
		Order.transaction do
			user.carts.each do | cart |
				order = Order.new
				if order.make_orders_ok? cart, order.clone_address_ok?(user.default_addr.to_i)
					order.destroy_carts cart.id
				else
					break
				end
			end
		end
	end
	
	def clone_address_ok? default_addr   #克隆默认地址信息
		if address_backup = AddressBackup.create( address_attr(default_addr) )
			address_backup   #返回新克隆的地址
		else
			false
		end
	end

	def make_orders_ok? cart, address_backup     #创建订单
		self.attributes = order_attr(cart, address_backup)
		if self.save
			true
		else
			false
		end	
	end
	
	def order_attr cart, address_backup  #设置order信息
		order_attr = {:user_id => cart.user_id,
									:product_id => cart.product_id,
									:price => cart.product.price,
									:number => cart.number,
									:counts => cart.number * cart.product.price,
									:address_id => address_backup.id }
	end

	def address_attr default_addr   #设置默认地址属性, 复制地址
		address = Address.find default_addr
		address_attr = {:user_id => address.user_id,
										:province => address.province,
										:city => address.city,
										:country => address.country,
										:description => address.description,
										:consignee => address.consignee,
										:phonenumber => address.phonenumber}
	end
	
	def destroy_carts cart_id   #删除购物车商品
		Cart.find(cart_id).destroy
	end

end

