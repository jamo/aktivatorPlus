class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :body
      t.integer :choice
      t.references :answer_options

      t.timestamps
    end
    add_index :answers, :answer_options_id
  end
end
