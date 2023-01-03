# frozen_string_literal: true

module Admin
  module SubjectsHelper
    def get_all_subjects
      Admin::Subject.all.map { |subject| [subject.name, subject.id] }
    end
  end
end
