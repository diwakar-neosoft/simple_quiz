class RemoveColumnFromUsers < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :test_assigned
  end

  def down
    add_column :users, :test_assigned, :boolean, default: false
  end

end
