class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :price
      t.string :description
      t.integer :inventory
      t.timestamps null: false
    end
  end
end
