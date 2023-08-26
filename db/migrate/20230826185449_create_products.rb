class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand_name
      t.references :vendor, foreign_key: true, null: false

      t.timestamps
    end
  end
end
