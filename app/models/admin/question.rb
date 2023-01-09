# frozen_string_literal: true

module Admin
  # Question.rb
  class Question < ApplicationRecord
    self.table_name = 'questions'

    enum :inputType, ['true/false', 'multipleChoice', 'list', 'descriptive']
    store :optionValues, accessors: %i[option1 option2 option3 option4], coder: JSON

    belongs_to :subject

    validates_presence_of :inputType, :title
    validate :options_and_answer

    private

    def options_and_answer
      if inputType == 'true/false' && !answer.present?
        errors.add(:answer, ' should be present')
      elsif (inputType == 'multipleChoice') && !(optionValues.keys.size == 4 && optionValues.values.include?('1'))
        errors.add(:all, 'field should be fill')
      end
    end
  end
end
