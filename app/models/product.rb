class Product < ActiveRecord::Base
	validates :product_name, presence: { message: "产品名不能为空"}
	validates :product_name, uniqueness: { message: "产品名已存在"}
	validates :description, presence: { message: "产品描述不能为空"}
	validates :price, presence: { message: "价格不能为空"}
	validates :inventory, presence: { message: "库存不能为空"}

	has_many :carts
	has_many :orders
	belongs_to :user
end
