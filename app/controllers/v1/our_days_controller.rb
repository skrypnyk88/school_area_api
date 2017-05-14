module V1
  class OurDaysController < ApplicationController
    include Reportable

    def show
      @our_day = single_report_renderer(OurDay, @group).call if @students.any?
    end

    def update
      @our_day = OurDay.find_by(day: @day, group_id: @group)
      if @our_day.update_attributes(our_day_params)
        render :show
      else
        render json: { errors: @our_day.errors.full_messages },
               status: :bad_request
      end
    end

    private

    def our_day_params
      params.require(:our_day).permit(:description)
    end
  end
end
