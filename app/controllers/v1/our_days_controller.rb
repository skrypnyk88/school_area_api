module V1
  class OurDaysController < ApplicationController
    before_action :find_groups, only: [:index, :create]
    before_action :join_our_day, only: [:show, :update, :destroy]
    
    def index
      @our_days = @group.our_days
    end

    def create
      @our_day = @group.our_days.build(our_day_params)
      if @our_day.save
        render :show
      else
        head :bad_request
      end
    end

    def show
    end

    def update
      if @our_day.update(our_day_params)
        render :show
      else
        head :bad_request
      end
    end

    def destroy
      @our_day.destroy
      head :ok
    end

    private
    
    def join_our_day
      @our_day = OurDay.find_by(id: params[:id])
      head :bad_request unless @our_day
    end
    
    def find_groups
      @group = Group.find_by(id: params[:group_id])
      head :bad_request unless @group
    end

    def our_day_params
      params.require(:our_day).permit(:description, :day)
    end
  end
end
