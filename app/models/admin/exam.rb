module Admin
  class Exam < ApplicationRecord
    self.table_name = 'exams'

    has_and_belongs_to_many :subjects
    has_many :users
    
    validates :name, presence: true, uniqueness: true
    validate :should_have_one_subject

    private
    
    def should_have_one_subject
      if self.subject_ids.blank?
        errors.add(:subject_ids, 'can`t be blank.')
      end
    end
    
  end
end