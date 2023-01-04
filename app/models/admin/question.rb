# frozen_string_literal: true

module Admin
  class Question < ApplicationRecord
    self.table_name = 'questions'

    enum :inputType, ['true/false', 'multipleChoice', 'list', 'descriptive']
    store :optionValues, accessors: %i[option1 option2 option3 option4 answer], coder: JSON
  
    belongs_to :subject

    validates_presence_of :inputType,:title
  end
end
