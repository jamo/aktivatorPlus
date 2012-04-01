class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.references :cource

      t.timestamps
    end
    add_index :questions, :cource_id
    
  end
end
