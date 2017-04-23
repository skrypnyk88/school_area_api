module V1
  class BottlesController < ApplicationController
    before_action :find_group,

    def create
      @bottle = Bottle.new(time: DateTime.now, quantity: 30,
      bottle_report_id: params[:bottle_report_id])
      @bottle.save ? (render :bottle) : (head :bad_request)
    end

    def update
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      head :not_found if @bottle.nil?
      @bottle
      .update_attributes(bottle_params) ? (render :bottle) : (head :bad_request)
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
  end
end
