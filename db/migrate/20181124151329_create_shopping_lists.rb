class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :name, limit: 20, null: false
      t.string :description, null: false
      t.boolean :purchased

      t.timestamps null: false
    end
  end
end
