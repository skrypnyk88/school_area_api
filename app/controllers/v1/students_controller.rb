module V1
  class StudentsController < ApplicationController
    include Attachable
    include Groupable

    before_action :find_student, except: [:index, :create]

    def index
      @students = Student.where(group: @group).includes(:attachment)
    end

    def create
      @student = Student.new(student_params)
      if @student.save
        render @student, status: :created
      else
        render json: { errors: @student.errors.full_messages },
               status: :bad_request
      end
    end

    def show
      render @student
    end

    def update
      if @student.update_attributes(student_params)
        render @student
      else
        render json: { errors: @student.errors.full_messages },
               status: :bad_request
      end
    end

    def destroy
      @student.destroy
      head :no_content
    end

    def upload
      attachment = attachment_uploader.call(attachment_owner: @student)
      if attachment.valid?
        render @student, status: :created
      else
        render json: { errors: attachment.errors.full_messages },
               status: :bad_request
      end
    end

    private

    def find_student
      @student = Student.find_by(id: params[:id], group: @group)
      return if @student

      render json: { errors: [I18n.t('callbacks.student_not_found')] },
             status: :not_found
    end

    def student_params
      params.require(:student)
            .permit(:first_name, :last_name, :birthdate, :gender)
    end
  end
end
