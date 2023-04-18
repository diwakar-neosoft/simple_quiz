class ExamSubmissionsController < ApplicationController

	def new
		if current_user.test_assigned && !current_user.appear
			@questions = Admin::Question.joins(subject: :exams).where(exams: {id: current_user.exam_id}).order(:id)
			@exam_submission = ExamSubmission.new(exam_id: current_user.exam_id, user_id: current_user.id)
			@exam_submission.exam_submission_answers.build
		else
			redirect_to root_path
		end
	end

	def create
		@exam_submission = ExamSubmission.new(exam_submission_params)
		@exam_submission.user_id = current_user.id
		@exam_submission.exam_id = current_user.exam_id
		if @exam_submission.save
			current_user.update( appear: true, exam_id: nil )
			redirect_to root_path, notice: 'You have successfully completed your test.'
		else
			flash[:alert] = 'Something went wrong.'
			new
		end
	end

	private

	def exam_submission_params
		params.require(:exam_submission).permit( :user_id, :exam_id, exam_submission_answers_attributes: [ :id, :subject_id, :question_id, :answer, answer: [] ] )
	end
end