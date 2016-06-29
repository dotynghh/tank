class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :salt
    	t.string :crypted_password
    	t.string :email
    	t.string :active_code
    	t.boolean :is_active, default: false
      t.timestamps null: false
    end
  end
end
