class AddProductSpecificAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :extra_info, :hstore, null: false, default: ""
  end
end
