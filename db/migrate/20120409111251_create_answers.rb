class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :body
      t.integer :choice
      t.references :questions

      t.timestamps
    end
    add_index :answers, :questions_id
  end
end
