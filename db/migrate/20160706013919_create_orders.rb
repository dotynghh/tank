class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :address_id
      t.integer :price
      t.integer :number
      t.integer :counts
      t.timestamps null: false
    end
  end
end
