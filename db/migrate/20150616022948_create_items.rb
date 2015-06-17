class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id, null: false
      t.integer :building_id
      t.integer :floor_id
      t.string :room, null: false
      t.integer :quantity
      t.decimal :cost_per_item, null: false, default: 0.0
      t.decimal :total_amount, null: false, default: 0.0
      t.integer :product_id, null: false
      t.integer :product_type, null: false

      t.timestamps null: false
    end
  end
end
