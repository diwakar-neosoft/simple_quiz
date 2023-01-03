# frozen_string_literal: true

json.array! @admin_questions, partial: 'admin_questions/admin_question', as: :admin_question
