class Api::V1::RequestsController < ApplicationController

	def index
		requests = Request.all
		render json: requests
	end

	def create
		request = Request.create({
			parent_id: params[:parent_id].to_i,
			babysitter_id: params[:babysitter_id].to_i
		})
		render json: request
	end

	private

	def requests_params
		params.require(:requests).permit(:parent_id, :babysitter_id)
	end

end
