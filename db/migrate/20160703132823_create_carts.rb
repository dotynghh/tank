class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.integer :product_id
    	t.integer :user_id
    	t.integer :number, default: 1
      t.timestamps null: false
    end
  end
end
