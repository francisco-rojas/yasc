class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :name, null: false, unique: true
      t.string :model, null: false, default: ''
      t.text :description, null: false, default: ''
      t.decimal :nrc, null: false, deault: 0.0
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
