# frozen_string_literal: true

class CreateAdminQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :title
      t.integer :inputType, default: 0
      t.jsonb :optionValues
      t.references :subject, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
