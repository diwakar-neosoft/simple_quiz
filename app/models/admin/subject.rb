# frozen_string_literal: true

module Admin
  # Subject.rb
  class Subject < ApplicationRecord
    self.table_name = 'subjects'

    has_many :questions, dependent: :destroy
    has_and_belongs_to_many :exams
  end
end
