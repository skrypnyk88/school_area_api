module V1
  class BottlesController < ApplicationController
    before_action :find_bottle, only: [:update, :destroy]

    def create
      @bottle = Bottle.new(time: DateTime.now, quantity: 30,
                           bottle_report_id: params[:bottle_report_id])
      @bottle.save
      render :bottle
    end

    def update
      if @bottle.update_attributes(bottle_params)
        render :bottle
      else
        render :bad_request
      end
    end

    def destroy
      @bottle.destroy
      head :ok
    end

    private

    def find_bottle
      @bottle = Bottle.find_by(id: params[:id])
      render :not_found if @bottle.nil?
    end

    def bottle_params
      params.require(:bottle).permit(:quantity, :time, :uom)
    end
  end
end
