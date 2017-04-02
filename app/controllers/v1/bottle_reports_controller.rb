module V1
	class BottleReportsController < ApplicationController		

		def show
			date = Date.parse(params[:day])
			@bottle_report = BottleReport.where(:day => date.beginning_of_day..date.end_of_day).first
				if 	@bottle_report.nil?
						@bottle_report = BottleReport.new
						@bottle_report.day = date
						@bottle_report.save
				end
				get_report_bottles(@bottle_report.id)
				render :json => { :bottle_report => @bottle_report, :bottles => @bottles }
		end

		def create
			@bottle = Bottle.new(quantity: 30, time: DateTime.now, uom: 'ml', bottle_report_id: params[:bottle_report_id])
			@bottle.save
			render json: @bottle
		end

		def update
			@bottle = Bottle.find(params[:id])
			if @bottle.nil?
				render :json => { :error => 'Not found' } 
			end
	    @bottle.update_attributes(bottle_params)
			@bottle.save
			render json: @bottle
		end

		def destroy
			@bottle = Bottle.find(params[:id])
			if @bottle.nil?
				render :json => { :error => 'Not found' } 
			end
			@bottle.destroy
			head :ok
		end

		private
		def get_report_bottles(bottle_report_id)
			@bottles = Bottle.where(:bottle_report_id	=> bottle_report_id)
		end

		def bottle_params
			params.permit(:quantity, :time, :uom)
		end
	end
end
