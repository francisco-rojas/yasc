class CreateLamp < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :name
      t.text :description
      t.decimal :nrc, default: 0.0
      t.boolean :active, default: true
    end

    add_index :lamps, :name, unique: true
    add_index :lamps, :active
  end
end
