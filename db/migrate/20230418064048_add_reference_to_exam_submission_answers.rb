class AddReferenceToExamSubmissionAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :exam_submission_answers, :exam_submission, null: false, foreign_key: true
  end
end
