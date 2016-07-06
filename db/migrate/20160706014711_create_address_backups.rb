class CreateAddressBackups < ActiveRecord::Migration
  def change
    create_table :address_backups do |t|
      t.integer :user_id
      t.integer :phonenumber
      t.string :province
      t.string :city
      t.string :country
      t.string :description
      t.boolean :is_default, default: false
      t.timestamps null: false
    end
  end
end
