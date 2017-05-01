module V1
  class BottlesController < ApplicationController
    def create
      @bottle = Bottle.new(time: DateTime.now,
                           quantity: 30,
                           uom: 'ml',
                           bottle_report_id: params[:bottle_report_id])
      if @bottle.save
        render :bottle
      else
        render json: { errors: @bottle.errors.full_messages }
      end
    end

    def update
      @bottle = Bottle.find_by id: params[:id]
      head :not_found if @bottle.nil?
      if @bottle.update_attributes(bottle_params)
        render :bottle
      else
        render json: { errors: @bottle.errors.full_messages }
      end
    end

    def destroy
      @bottle = Bottle.find_by id: params[:id]
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
