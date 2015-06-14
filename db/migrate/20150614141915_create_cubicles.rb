class CreateCubicles < ActiveRecord::Migration
  def change
    create_table :cubicles do |t|
      t.integer :height, null: false, default: 0
      t.integer :area, null: false, default: 0
      t.text :description, null: false, default: ''
      t.integer :unit_of_measure, null: false, default: 0
      t.integer :purchase_type, null: false, default: 0
      t.decimal :nrc, null: false, default: 0.0
      t.decimal :mrc, null: false, default: 0.0
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
