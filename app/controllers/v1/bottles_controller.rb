module V1
  class BottlesController < ApplicationController
    before_action :fill_bottle_report
    before_action :find_bottle, only: [:update, :destroy]

    def index
      @bottles = @bottle_report.bottles
    end

    def create
      @bottle = Bottle.new(time: DateTime.now, quantity: 30,
                           bottle_report_id: params[:bottle_report_id])
      result_handler(@bottle.save)
    end

    def update
      result_handler(@bottle.update_attributes(bottle_params))
    end

    def destroy
      @bottle.destroy
      head :ok
    end

    private

    def fill_bottle_report
      group = Group.find_by id: params[:group_id]
      nil_handler(group)
      @bottle_report = group.bottle_reports
                            .find_by id: params[:bottle_report_id]
      nil_handler(@bottle_report)
    end

    def find_bottle
      @bottle = @bottle_report.bottles.find_by id: params[:id]
      nil_handler(@bottle)
    end

    def nil_handler(obj)
      head :not_found if obj.nil?
    end

    def result_handler(result)
      result ? (render :bottle) : (head :bad_request)
    end

    def bottle_params
      params.require(:bottle).permit(:quantity, :time, :uom)
    end
  end
end
