class CreateChairProducts < ActiveRecord::Migration
  def change
    create_table :chair_products do |t|
      t.integer :chair_id, null: false

      t.timestamps null: false
    end
  end
end
