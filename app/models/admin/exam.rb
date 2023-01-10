module Admin
  class Exam < ApplicationRecord
    self.table_name = 'exams'

    has_and_belongs_to_many :subjects
  end
end