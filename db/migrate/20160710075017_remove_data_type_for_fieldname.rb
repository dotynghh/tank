class RemoveDataTypeForFieldname < ActiveRecord::Migration
  def change
  	remove_column :addresses, :is_default
  	remove_column :address_backups, :is_default
  end
end
