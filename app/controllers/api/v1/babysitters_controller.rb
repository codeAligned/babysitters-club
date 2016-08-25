class Api::V1::BabysittersController < ApplicationController
	skip_before_action :authenticate, only: [:create]

	def index
		render json: Babysitter.all, includes:['parents','requests','bookings', 'booking_requests']
	end

	def show
		babysitter = Babysitter.find(params[:id])
		render json: babysitter
	end

	def update
		babysitter = User.find(params[:id])
		updated_babysitter = Babysitter.find_by(user_id: babysitter.id)
		updated_babysitter.update(babysitter_params)
		render json: updated_babysitter
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
