class CreateShorts < ActiveRecord::Migration
  def change
    create_table :shorts do |t|
      t.string :uri
      t.string :shortener
      t.integer :clicks

      t.timestamps
    end
  end
end
