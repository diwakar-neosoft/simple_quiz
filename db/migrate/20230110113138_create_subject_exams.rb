class CreateSubjectExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams_subjects do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
