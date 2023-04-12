class Admin::UsersController < Admin::ApplicationController
	def index
		@admin_users = User.all.order(:id)
		@exam_ids = Admin::Exam.pluck(:id,:name)
	end

	def show
		@admin_user = User.find(params[:id])
	end

	def edit
		@admin_user = User.find(params[:id])
	end

	def update
		@admin_user = User.find(params[:id])
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_users_url(@admin_user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def admin_user_params
		params.require(:user).permit(:email, :appear, :exam_id)
	end
end