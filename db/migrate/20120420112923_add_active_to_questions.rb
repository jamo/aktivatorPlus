class AddActiveToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :active, :boolean

  end
end
