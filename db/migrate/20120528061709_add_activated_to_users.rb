class AddActivatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activated, :boolean
    add_column :users, :super_admin, :boolean

  end
end
