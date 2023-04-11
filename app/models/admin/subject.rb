# frozen_string_literal: true

module Admin
  # Subject.rb
  class Subject < ApplicationRecord
    self.table_name = 'subjects'

    has_many :questions, dependent: :destroy
    has_and_belongs_to_many :exams

    validate :validate_number_of_questions
    
    private

    def validate_number_of_questions
      if self.num_of_questions == self.questions.size
        errors.add(:num_of_questions, 'limit exceeded please either remove questions or increase limit.')
      end
    end
  end
end
