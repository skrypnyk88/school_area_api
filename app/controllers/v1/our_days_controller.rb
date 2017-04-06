module V1
  class OurDaysController < ApplicationController
    def index
      @our_days = OurDay.all
    end

    def create
      @our_day = OurDay.new(our_day_params)
      if @our_day.save
        render :show
      else
        head :bad_request
      end
    end

    def show
      @our_day = OurDay.find(params[:id])
    end

    def update
      @our_day = OurDay.find(params[:id])
      if @our_day.update(our_day_params)
        render :show
      else
        head :bad_request
      end
    end

    def destroy
      @our_day = OurDay.find(params[:id])
      @our_day.destroy
      head :ok
    end

    private

    def our_day_params
      params.require(:our_day).permit(:description, :day)
    end
  end
end
