class Api::V1::RequestsController < ApplicationController

	def index
		requests = Request.all
		render json: requests
	end

	def create
		request = Request.create({
			parent_id: request_params[:parent_id],
			babysitter_id: request_params[:babysitter_id]
		})
		render json: request
	end

	def update
		network_request = Request.accept(network_requests_params[:id])
		render json: network_request
	end

	private

	def request_params
		params.require(:request).permit(:parent_id, :babysitter_id)
	end

	def network_requests_params
		params.require(:requests).permit(:id)
	end

end
