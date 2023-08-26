class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|
      t.integer :length
      t.integer :width
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end
  end
end
