json.extract! admin_question, :id, :title, :inputType, :optionValues, :answer, :subject_id, :created_at, :updated_at
json.url admin_question_url(admin_question, format: :json)
