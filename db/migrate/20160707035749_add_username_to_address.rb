class AddUsernameToAddress < ActiveRecord::Migration
  def change
  	add_column :addresses, :consignee, :string, null: false
  end
end
