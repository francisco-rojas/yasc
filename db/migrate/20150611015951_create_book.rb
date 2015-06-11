class CreateBook < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.decimal :nrc, default: 0.0
      t.boolean :active, default: true
    end

    add_index :books, :name, unique: true
    add_index :books, :active
  end
end
