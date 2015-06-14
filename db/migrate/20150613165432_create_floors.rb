class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.string :name, null: false, unique: true
      t.integer :number, null: false
      t.integer :building_id, null: false

      t.timestamps null: false
    end

    add_index :floors, [:number, :building_id], unique: true
    add_foreign_key :floors, :buildings, dependent: :delete
  end
end
