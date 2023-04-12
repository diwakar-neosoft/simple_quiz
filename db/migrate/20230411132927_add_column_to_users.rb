class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :appear, :boolean,default: false
    add_reference :users, :exam
  end
end
