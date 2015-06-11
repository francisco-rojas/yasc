class CreateHouse < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.text :description
      t.decimal :nrc, default: 0.0
      t.decimal :mrc, default: 0.0
      t.boolean :active, default: true
      t.integer :purchase_type
    end

    add_index :houses, :name, unique: true
    add_index :houses, :active
    add_index :houses, :purchase_type
  end
end
