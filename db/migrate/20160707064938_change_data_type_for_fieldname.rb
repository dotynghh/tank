class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def change
  	change_column :addresses, :phonenumber, :string
  	change_column :address_backups, :phonenumber, :string
  end
end
