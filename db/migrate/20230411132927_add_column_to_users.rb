class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :test_taken, :boolean,default: false
  end
end
