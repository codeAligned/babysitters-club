class Api::V1::ParentsController < ApplicationController
	skip_before_action :authenticate, only: [:create]

	def index
		render json: Parent.all, includes:['babysitters','requests','bookings', 'booking_requests']
	end

	def show
		parent = Parent.find(params[:id])
		render json: parent
	end

	def update
		# We need to finish this upon getting session to work
		parent = Parent.find(params[:id])
		parent.update(name: params[:name], email: params[:email])
		# (parents_params) don't forget patch!
		render json: parent
	end

  def destroy
    parent = Parent.find(params[:id])
    parent.delete
  end

	private

	def parents_params
		params.require(:parents).permit(:name, :email)
	end

end
