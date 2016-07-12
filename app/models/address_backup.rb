class AddressBackup < ActiveRecord::Base
	has_many :orders, class_name: :Order, foreign_key: :address_id
end
