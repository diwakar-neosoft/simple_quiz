# frozen_string_literal: true

module Admin
  # examsController
  class ExamsController < Admin::ApplicationController
    before_action :set_admin_exam, only: %i[show edit update destroy]

    def index
      @admin_exams = Admin::Exam.all
    end

    def show
      @questions = Admin::Question.joins(subject: :exams).where(exams: {id: params[:id]}).order(:id)
    end

    def new
      @admin_exam = Admin::Exam.new
    end

    def edit; end

    def create
      @admin_exam = Admin::Exam.new(admin_exam_params)

      respond_to do |format|
        if @admin_exam.save
          format.html { redirect_to admin_exam_url(@admin_exam), notice: 'exam was successfully created.' }
          format.json { render :show, status: :created, location: @admin_exam }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_exam.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @admin_exam.update(admin_exam_params)
          format.html { redirect_to admin_exam_url(@admin_exam), notice: 'Exam was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_exam }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin_exam.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @admin_exam.destroy

      respond_to do |format|
        format.html { redirect_to admin_exams_url, notice: 'Exam was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_admin_exam
      @admin_exam = Admin::Exam.find(params[:id])
    end

    def admin_exam_params
      params.require(:admin_exam).permit(:name, subject_ids: [])
    end
  end
end
