class Admin::UsersController < Admin::ApplicationController
	def index
		@admin_users = User.all
		@exam_ids = Admin::Exam.pluck(:id,:name)
	end
end