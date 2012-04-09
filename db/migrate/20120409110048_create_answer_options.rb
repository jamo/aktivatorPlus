class CreateAnswerOptions < ActiveRecord::Migration
  def change
    create_table :answer_options do |t|
      t.string :title
      t.text :body
      t.integer :choice
      t.references :question

      t.timestamps
    end
    add_index :answer_options, :question_id
  end
end
