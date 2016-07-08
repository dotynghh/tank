class ChangeRemoveIsdefaultToAddress < ActiveRecord::Migration
  def change
  	remove_column :addresses, :phonenumber
  	remove_column :address_backups, :phonenumber
  	add_column :users, :default_addr, :string, null: false
  end
end
