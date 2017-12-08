class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.references :order, foreign_key: true
      t.references :food, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
