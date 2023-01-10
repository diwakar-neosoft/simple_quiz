# frozen_string_literal: true

module Admin
  # examsController
  class ExamsController < Admin::ApplicationController
    before_action :set_admin_exam, only: %i[show edit update destroy]

    # GET /admin/exams or /admin/exams.json
    def index
      @admin_exams = Admin::Exam.all
    end

    # GET /admin/exams/1 or /admin/exams/1.json
    def show; end

    # GET /admin/exams/new
    def new
      @admin_exam = Admin::Exam.new
    end

    # GET /admin/exams/1/edit
    def edit; end

    # POST /admin/exams or /admin/exams.json
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

    # PATCH/PUT /admin/exams/1 or /admin/exams/1.json
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

    # DELETE /admin/exams/1 or /admin/exams/1.json
    def destroy
      @admin_exam.destroy

      respond_to do |format|
        format.html { redirect_to admin_exams_url, notice: 'Exam was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_exam
      @admin_exam = Admin::Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_exam_params
      params.require(:admin_exam).permit(:name)
    end
  end
end
