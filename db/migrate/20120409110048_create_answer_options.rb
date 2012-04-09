class CreateAnswerOptions < ActiveRecord::Migration
  def change
    create_table :answer_options do |t|
      t.string :title
      t.text :body
      t.integer :choice
      t.references :question

      t.timestamps
    end
  end
end
