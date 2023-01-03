# frozen_string_literal: true

module Admin
  class SubjectsController < Admin::ApplicationController
    before_action :set_admin_subject, only: %i[show edit update destroy]

    # GET /admin/subjects or /admin/subjects.json
    def index
      @admin_subjects = Admin::Subject.all
    end

    # GET /admin/subjects/1 or /admin/subjects/1.json
    def show; end

    # GET /admin/subjects/new
    def new
      @admin_subject = Admin::Subject.new
    end

    # GET /admin/subjects/1/edit
    def edit; end

    # POST /admin/subjects or /admin/subjects.json
    def create
      @admin_subject = Admin::Subject.new(admin_subject_params)

      respond_to do |format|
        if @admin_subject.save
          format.html { redirect_to admin_subject_url(@admin_subject), notice: 'Subject was successfully created.' }
          format.json { render :show, status: :created, location: @admin_subject }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_subject.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/subjects/1 or /admin/subjects/1.json
    def update
      respond_to do |format|
        if @admin_subject.update(admin_subject_params)
          format.html { redirect_to admin_subject_url(@admin_subject), notice: 'Subject was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_subject }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin_subject.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/subjects/1 or /admin/subjects/1.json
    def destroy
      @admin_subject.destroy

      respond_to do |format|
        format.html { redirect_to admin_subjects_url, notice: 'Subject was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_subject
      @admin_subject = Admin::Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_subject_params
      params.require(:admin_subject).permit(:name, :num_of_questions)
    end
  end
end
