class HealthReportsController < ApplicationController
  def show
    @reports = HealthReport.find(params[:id])
  end

  def new
    @reports = HealthReport.new
  end

  def index
    @reports = HealthReport.all
  end

  def create
    @report = HealthReport.new(report_params)
    if @reports.save
      redirect_to @report
    else
      render 'new'
    end
  end

  def edit
    @report = HealthReport.find(params[:id])
  end

  def update
    @report = HealthReport.find(params[:id])
    if @report.update_attributes(report_params)
      redirect_to @report
    else
      render 'edit'
    end
  end

  private

    def report_params
      params.requre(:healthReport).permit(:health_note, :special_care)
    end
end
