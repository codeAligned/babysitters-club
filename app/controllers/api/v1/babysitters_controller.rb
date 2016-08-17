class Api::V1::BabysittersController < ApplicationController
	skip_before_action :authenticate, only: [:create]

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
		byebug
		babysitter = Babysitter.find(params[:id])
		babysitter.update(babysitter_params)
		# (babysitter_params) don't forget patch!
		render json: babysitter
	end

  def destroy
    babysitter = Babysitter.find(params[:id])
    babysitter.delete
  end

	private

 	def babysitter_params
	 	params.require(:user).permit(:age, :location, :bio, :skills)
 	end



end
