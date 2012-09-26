class AddChoiceToComment < ActiveRecord::Migration
  def up
    add_column :comments, :choice, :string, :null => "", :default => ""
  end
  
  def down
    remove_column :comments, :choice
  end
  
end
