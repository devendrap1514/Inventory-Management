class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :product_variant, foreign_key: true, null: false
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
