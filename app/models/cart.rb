class Cart < ActiveRecord::Base
  validates_uniqueness_of :product_id, scope: [:user_id]
	belongs_to :user

end
