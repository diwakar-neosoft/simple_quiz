# frozen_string_literal: true

module Admin
  class Question < ApplicationRecord
    self.table_name = 'questions'
    belongs_to :subject

    enum :inputType, [ "true/false", "multipleChoice", "list", "descriptive"]
    store :optionValues, accessors: %i[option1 option2 option3 option4 answer], coder: JSON
  end
end
