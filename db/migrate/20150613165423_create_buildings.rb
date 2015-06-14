class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name, null: false, unique: true
      t.string :address, null: false

      t.timestamps null: false
    end
  end
end
