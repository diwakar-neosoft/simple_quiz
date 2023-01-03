class CreateAdminSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :num_of_questions

      t.timestamps
    end
  end
end
