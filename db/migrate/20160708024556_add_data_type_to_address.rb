class AddDataTypeToAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :phonenumber, :string, null: false
  	add_column :address_backups, :phonenumber, :string, null: false
  end
end
