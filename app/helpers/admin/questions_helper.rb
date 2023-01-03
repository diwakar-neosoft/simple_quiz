# frozen_string_literal: true

module Admin
  module QuestionsHelper
    def input_type_options
      Admin::Question.inputTypes.keys
    end
  end
end
