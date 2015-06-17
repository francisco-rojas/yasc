class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :building_id
      t.integer :status, null: false
      t.string :number
      t.decimal :total_amount, null: false, precision: 8, scale: 2, default: 0.0
      t.integer :items_count, null: false, default: 0

      t.timestamps null: false
    end

    # add_index :order, [:user_id, :status], unique: true, where: "status = 0"
  end
end
