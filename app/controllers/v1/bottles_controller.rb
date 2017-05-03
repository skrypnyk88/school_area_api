module V1
  class BottlesController < ApplicationController
    before_action :find_bottle_report

    def create
      @bottle = @bottle_report.bottles.new
      if @bottle.save
        render :bottle
      else
        render json: { errors: @bottle.errors.full_messages }, status: 500
      end
    end

    def update
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      head :not_found if @bottle.nil?
      if @bottle.update_attributes(bottle_params)
        render :bottle
      else
        render json: { errors: @bottle.errors.full_messages }, status: 500
      end
    end

    def destroy
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      head :not_found if @bottle.nil?
      @bottle.destroy
      head :ok
    end

    private

    def bottle_params
      params.require(:bottle).permit(:id,
                                     :bottle_report_id,
                                     :quantity,
                                     :time,
                                     :uom)
    end

    def find_bottle_report
      @bottle_report = BottleReport.includes(:bottles)
                                   .find_by(id: params[:bottle_report_id])
    end
  end
end
