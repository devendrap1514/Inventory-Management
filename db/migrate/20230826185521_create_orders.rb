class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false

      t.timestamps
    end
  end
end
