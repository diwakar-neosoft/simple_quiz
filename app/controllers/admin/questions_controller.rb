# frozen_string_literal: true

module Admin
  # QuestionsController
  class QuestionsController < Admin::ApplicationController
    before_action :set_admin_question, only: %i[show edit update destroy]

    # GET /admin/questions or /admin/questions.json
    def index
      @admin_questions = Admin::Question.all
    end

    # GET /admin/questions/1 or /admin/questions/1.json
    def show; end

    # GET /admin/questions/new
    def new
      @admin_question = Admin::Question.new
    end

    # GET /admin/questions/1/edit
    def edit; end

    # POST /admin/questions or /admin/questions.json
    def create
      optionValues = params[:optionsKeys]
      @admin_question = Admin::Question.new(admin_question_params)

      respond_to do |format|
        if @admin_question.save
          format.html { redirect_to admin_question_url(@admin_question), notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @admin_question }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_question.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/questions/1 or /admin/questions/1.json
    def update
      respond_to do |format|
        if @admin_question.update(admin_question_params)
          format.html { redirect_to admin_question_url(@admin_question), notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_question }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin_question.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/questions/1 or /admin/questions/1.json
    def destroy
      @admin_question.destroy

      respond_to do |format|
        format.html { redirect_to admin_questions_url, notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_question
      @admin_question = Admin::Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_question_params
      case params[:admin_question][:inputType]
      when 'true/false'
        params.require(:admin_question).permit(:title, :inputType, :answer,
                                               :subject_id).with_defaults(optionValues: {})
      when 'multipleChoice'
        keys = params[:admin_question][:optionKeys].values
        values = params[:admin_question][:isRight].values
        optionValues = update_option_values(keys, values)
        params.require(:admin_question).permit(:title, :inputType,
                                               :subject_id).merge(optionValues: optionValues).with_defaults(answer: nil)
      when 'list'
        keys = params[:admin_question][:listOptionKeys].values
        values = [false] * 4
        answer = params[:admin_question][:answer].to_i
        values[answer - 1] = true
        optionValues = update_option_values(keys, values)
        params.require(:admin_question).permit(:title, :inputType,
                                               :subject_id).merge(optionValues: optionValues).with_defaults(answer: nil)
      else
        params.require(:admin_question).permit(:title, :inputType, :subject_id).with_defaults(optionValues: nil, answer: nil)
      end
    end

    def update_option_values(keys, values)
      optionValues = {}
      [0, 1, 2, 3].each { |index| optionValues[keys[index]] = values[index] }
      optionValues
    end
  end
end
