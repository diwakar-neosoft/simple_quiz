class RemoveAnswerColumnFromQuestions < ActiveRecord::Migration[7.0]
  def up
    remove_column :questions, :answer
  end
  def down
    add_column :questions, :answer, :string
  end  
end
