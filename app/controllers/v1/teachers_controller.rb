module V1
  class TeachersController < ApplicationController
    include Attachable

    before_action :find_teacher

    def update
      if @teacher.update_attributes(teacher_params)
        render @teacher
      else
        render json: { errors: @teacher.errors.full_messages },
               status: :bad_request
      end
    end

    def teacher_params
      params.require(:teacher).permit(:first_name,
                                      :last_name,
                                      :email,
                                      :phone,
                                      :locale)
    end

    def upload
      attachment = attachment_uploader.call(attachment_owner: @teacher)
      if attachment.valid?
        render @teacher, status: :created
      else
        render json: { errors: attachment.errors.full_messages },
               status: :bad_request
      end
    end

    private

    def find_teacher
      @teacher = current_user
    end
  end
end
