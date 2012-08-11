class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :home
      t.string :login
      t.string :logout
      t.string :profile
      t.string :settings

      t.timestamps
    end
  end
end
