class ExamSubmission < ApplicationRecord
  
  belongs_to :user
  belongs_to :exam, class_name: 'Admin::Exam'
  has_many :exam_submission_answers, dependent: :destroy

  accepts_nested_attributes_for :exam_submission_answers

end
