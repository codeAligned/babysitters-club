class BabysittersController < ApplicationController


	def create
	end

	def index
		render json: Babysitter.all, includes:['parents','requests','bookings', 'booking_requests']
	end

	def show
		babysitter = Babysitter.find(params[:id])
		render json: babysitter
	end


end
