class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name, limit: 20, null: false
      t.string  :description, null: false
      t.integer :quantity, null: false
      t.float :price, null: false
      t.references :shopping_list, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
