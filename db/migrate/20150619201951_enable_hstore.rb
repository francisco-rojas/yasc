class EnableHstore < ActiveRecord::Migration
  def up
    execute "CREATE EXTENSION HSTORE;"
  end

  def down
    execute "DROP EXTENSION HSTORE;"
  end
end
