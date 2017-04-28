module V1
  class TeachersController < ApplicationController
    def show
      @teacher = current_user
    end

    def update
      if current_user.update(teacher_params)
        head :no_content
      else
        render json: { errors: current_user.errors.full_messages }
      end
    end

    def teacher_params
      params.require(:teacher)
            .permit(:first_name, :last_name, :email, :phone, :locale, :id)
    end
  end
end
