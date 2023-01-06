# frozen_string_literal: true

module Admin
  # Question.rb
  class Question < ApplicationRecord
    self.table_name = 'questions'

    enum :inputType, ['true/false', 'multipleChoice', 'list', 'descriptive']
    store :optionValues, accessors: %i[option1 option2 option3 option4 answer], coder: JSON

    belongs_to :subject

    validates_presence_of :inputType, :title
    validate :options_and_answer

    private

    def options_and_answer
      if inputType == 'true/false' && %w[true false].exclude?(answer.downcase)
        errors.add(:answer, ' should be either true or false')
      elsif (inputType == 'multipleChoice' || inputType == 'list') && (answer.blank? || option1.blank? || option2.blank? || option3.blank? || option4.blank?)
        errors.add(:all, 'field should be fill')
      elsif (inputType == 'multipleChoice' || inputType == 'list') && [option1, option2, option3,
                                                                       option4].exclude?(answer)
        errors.add(:answer, 'must be one of option.')
      end
    end
  end
end
