# frozen_string_literal: true

module Admin
  # SubjectsHelper
  module SubjectsHelper
    def all_subjects
      Admin::Subject.all.map { |subject| [subject.name, subject.id] }
    end
  end
end
