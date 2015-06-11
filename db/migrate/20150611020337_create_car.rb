class CreateCar < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.decimal :nrc, default: 0.0
      t.decimal :mrc, default: 0.0
      t.boolean :active, default: true
      t.integer :purchase_type
    end

    add_index :cars, :name, unique: true
    add_index :cars, :active
    add_index :cars, :purchase_type
  end
end
