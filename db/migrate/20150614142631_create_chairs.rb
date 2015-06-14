class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :model, null: false, default: ''
      t.text :description, null: false, default: ''
      t.decimal :nrc, null: false, deault: 0.0

      t.timestamps null: false
    end
  end
end
