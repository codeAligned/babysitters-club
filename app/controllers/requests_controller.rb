class RequestController < ApplicationController 

	def index 
		if params[:babysitter_id]
			request = Request.all_babysitter_request(params[:babysitter_id])
		elsif params[:parent_id]
			request = Request.all_parent_request(params[:parent_id])
		end 		 
		render json: requests
	end 

	def show
		
	end 

	def create
		request = Request.create({parent_id: params[:parent_id], babysitter_id: params[:babysitter_id]})
		render json: request
	end 

end

