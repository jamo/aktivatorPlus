class RemoveUsers < ActiveRecord::Migration
  def up
    drop_table :Users
  end

  def down
  end
end
