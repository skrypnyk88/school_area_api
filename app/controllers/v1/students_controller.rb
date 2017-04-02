module V1
  class StudentsController < ApplicationController
    def index
      @students = Student.all
    end

    def create
      @student = Student.new(student_params)
      if @student.save
        render :show
      else
        head :bad_request
      end
    end

    def show
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])
      if @student.update(student_params)
        render :show
      else
        head :bad_request
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      head :ok
    end

    private

    def student_params
      params.permit(:first_name, :last_name, :birthdate, :gender)
    end
  end
end
