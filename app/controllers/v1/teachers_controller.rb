module V1
  class TeachersController < ApplicationController
    def show
      @teacher = current_user
    end

    def update
      if current_user.update(current_teacher_params)
        head :no_content
      else
        render json: { errors: current_user.errors.full_messages },
               status: :bad_request
      end
    end

    def current_teacher_params
      params.require(:current_user).permit(:first_name,
                                           :last_name,
                                           :email,
                                           :phone,
                                           :locale)
    end
  end
end
