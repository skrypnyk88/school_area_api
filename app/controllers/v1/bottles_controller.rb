module V1
  class BottlesController < ApplicationController
    def create
      @bottle = Bottle.new(time: DateTime.now,
                           quantity: 30,
                           bottle_report_id: params[:bottle_report_id])
      render :bottle if @bottle.save
      render json: { errors: @bottle.errors.full_messages }
    end

    def update
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      head :not_found if @bottle.nil?
      render :bottle if @bottle.update_attributes(bottle_params)
      render json: { errors: @bottle.errors.full_messages }
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
