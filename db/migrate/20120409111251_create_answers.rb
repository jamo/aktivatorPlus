class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :body
      t.integer :choice
      t.references :question
      t.references :course
      t.references :answer_option
      

      t.timestamps
    end
    add_index :answers, :question_id
     add_index :answers, :course_id
     add_index :answers, :answer_option_id
  end
end
