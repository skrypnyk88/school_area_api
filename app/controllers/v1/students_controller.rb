module V1
  class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :update, :destroy]

    def index
      @students = Group.find(params[:group_id]).students
    end

    def create
      @student = Student.new(student_params)
      render_show_or_bad_request(@student.save)
    end

    def show; end

    def update
      render_show_or_bad_request(@student.update(student_params))
    end

    def destroy
      @student.destroy
      head :no_content
    end

    private

    def find_student
      if Student.exists?(params[:id])
        @student = Student.find(params[:id])
      else
        head :not_found
      end
    end

    def render_show_or_bad_request(succeed)
      succeed ? (render :show) : (head :bad_request)
    end

    def student_params
      params.require(:student)
            .permit(:first_name, :last_name, :birthdate, :gender)
    end
  end
end
