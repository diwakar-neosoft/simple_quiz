class CreateExamSubmissionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_submission_answers do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
