class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.references :question
      t.references :course

      t.timestamps
    end
    add_index :comments, :question_id
    add_index :comments, :course_id
  end
end
