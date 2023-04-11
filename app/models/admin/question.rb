# frozen_string_literal: true

module Admin
  # Question.rb
  class Question < ApplicationRecord
    self.table_name = 'questions'

    enum :inputType, ['true/false', 'multipleChoice', 'list', 'descriptive']
    store :optionValues, accessors: %i[option1 option2 option3 option4], coder: JSON

    belongs_to :subject

    validates_presence_of :inputType, :title
    validates_associated :subject
    validate :validate_true_and_false
    validate :validate_multiple_choice
    validate :validate_list

    private

    def validate_true_and_false
      if inputType == 'true/false' && !answer.present?
        errors.add(:answer, ' should be present')
      end
    end

    def validate_multiple_choice
      if (inputType == 'multipleChoice')
        unless (optionValues.keys.size == 4)
          errors.add(:all, 'options should be fill')
        end
        unless optionValues.values.include?('1')
          errors.add(:one, 'answer must be true')
        end
      end
    end

    def validate_list
      if (inputType == 'list') && !(optionValues.keys.size == 4 && optionValues.values.include?(true))
        errors.add(:option, 'field should be filled properly')
      end
    end
  end
end
