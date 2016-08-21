class Api::V1::RequestsController < ApplicationController

	def index
		requests = Request.all
		render json: requests
	end

	def create
		byebug
		request = Request.create({
			parent_id: request_params[:parent_id],
			babysitter_id: request_params[:babysitter_id]
		})
		render json: request
	end

	private

	def request_params
		params.require(:request).permit(:parent_id, :babysitter_id)
	end

end
