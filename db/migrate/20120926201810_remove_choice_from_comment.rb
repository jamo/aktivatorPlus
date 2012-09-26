class RemoveChoiceFromComment < ActiveRecord::Migration
  def up
    remove_column :comments, :choice   
  end
  
  def down

    add_column :comments, :choice, :string, :null => "", :default => ""
  end
end
