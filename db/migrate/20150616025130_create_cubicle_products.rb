class CreateCubicleProducts < ActiveRecord::Migration
  def change
    create_table :cubicle_products do |t|
      t.integer :cubicle_id, null: false

      t.timestamps null: false
    end
  end
end
