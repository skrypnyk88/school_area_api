module V1
  class MyDayReportsController < ApplicationController
    def index
      @reports = MyDayReport.all
    end

    def show
      @report = MyDayReport.find(params[:id])
    end

    def create
      @report = MyDayReport.new(report_params)
      if @report.save
        render 'create.json.jbuilder'
      else
        render json: { error: 'Incorrect data' }
      end
    end

    def update
      @report = MyDayReport.find(params[:id])
      @report.update_attributes(report_params)
      if @report.save
        render 'update.json.jbuilder'
      else
        render json: { error: 'Incorrect data' }
      end
    end

    def destroy
      @report = MyDayReport.find(params[:id])
      @report.destroy
    end

    private

    def report_params
      params.require(:report).permit(:day, :note)
    end
  end
end
