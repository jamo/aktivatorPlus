class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
    add_index :questions, :course_id
    
  end
end
