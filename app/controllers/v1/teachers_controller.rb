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
      upload_attachment(@teacher)
    end

    private

    def find_teacher
      @teacher = current_user
    end
  end
end
