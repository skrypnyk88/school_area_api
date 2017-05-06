module V1
  class BottlesController < ApplicationController
    include Groupable

    before_action :find_bottle_report

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
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      if @bottle.nil?
        head :not_found
      else
        if @bottle.update_attributes(bottle_params)
           render :bottle
        else
           render json: { errors: @bottle.errors.full_messages },
                  status: :bad_request
        end
      end
    end

    def destroy
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      if @bottle.nil?
        head :not_found
      else
        @bottle.destroy
        head :ok
      end
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
  end
end
