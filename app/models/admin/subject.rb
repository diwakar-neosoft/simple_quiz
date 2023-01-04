# frozen_string_literal: true

module Admin
  class Subject < ApplicationRecord
    self.table_name = 'subjects'

    has_many :questions
  end
end
