class Address < ActiveRecord::Base

  validates :consignee, presence: { message: "收获人不能为空"}
  validates :province, presence: { message: "省份不能为空"}
  validates :phonenumber, presence: { message: "联系电话不能为空"}
	belongs_to :user
end
