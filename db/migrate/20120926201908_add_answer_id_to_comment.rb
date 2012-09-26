class AddAnswerIdToComment < ActiveRecord::Migration
  def up
    add_column :comments, :answer_id, :integer, :null => 0
  end
  
  def down
    remove_column :comments, :answer_id
  end

end
