class ExamPaperController < ApplicationController
	before_action :check_exam, only: :index
	def index
		@questions = Admin::Question.joins(subject: :exams).where(exams: {id: @exam.id})
	end

	private

	def check_exam
		@exam = current_user.test_assigned
		unless !!@exam
			redirect_to root_path, notice: 'You have no exam assigned currently.'
		end
	end
end