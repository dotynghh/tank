class AddUsernameToAddressbackup < ActiveRecord::Migration
  def change
  	add_column :address_backups, :consignee, :string, null: false
  end
end
