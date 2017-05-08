module V1
  class BottlesController < ApplicationController
    include Groupable

    before_action :find_bottle_report
    before_action :find_bottle, only: [:update, :destroy]

    def create
      @bottle = @bottle_report.bottles.new
      if @bottle.save
        render :bottle
      else
        render json: { errors: @bottle.errors.full_messages },
               status: :bad_request
      end
    end

    def update
      if @bottle.update_attributes(bottle_params)
        render :bottle
      else
        render json: { errors: @bottle.errors.full_messages },
               status: :bad_request
      end
    end

    def destroy
      @bottle.destroy
      head :ok
    end

    private

    def bottle_params
      params.require(:bottle).permit(:quantity,
                                     :time,
                                     :uom)
    end

    def find_bottle_report
      @bottle_report = BottleReport.includes(:bottles)
                                   .find_by(id: params[:bottle_report_id],
                                            group_id: @group)
    end

    def find_bottle
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      head :not_found unless @bottle
    end
  end
end
