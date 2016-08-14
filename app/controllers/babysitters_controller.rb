class BabysittersController < ApplicationController


	def create
		babysitter = Babysitter.create(name: params[:name], email: params[:email])
		# babysitter = Babysitter.create(babysitter_params)
		render json: babysitter
	end

	def index
		render json: Babysitter.all, includes:['parents','requests','bookings', 'booking_requests']
	end

	def show
		babysitter = Babysitter.find(params[:id])
		render json: babysitter
	end

	def update
		babysitter = Babysitter.find(params[:babysitter_id])
		babysitter.update(name: params[:name], email: params[:email])
		# (babysitter_params) don't forget patch!
		render json: babysitter
	end

	private

 	def babysitter_params
	 	params.require(:babysitter).permit(:name, :email)
 	end



end
