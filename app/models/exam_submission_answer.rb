class ExamSubmissionAnswer < ApplicationRecord
  
  belongs_to :subject,class_name: 'Admin::Subject'
  belongs_to :question, class_name: 'Admin::Question'
  belongs_to :exam_submission
  
end
