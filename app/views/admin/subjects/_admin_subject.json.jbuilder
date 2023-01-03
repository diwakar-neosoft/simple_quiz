# frozen_string_literal: true

json.extract! admin_subject, :id, :name, :num_of_questions, :created_at, :updated_at
json.url admin_subject_url(admin_subject, format: :json)
