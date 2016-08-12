class ParentsController < ApplicationController 

	def create
		parent = Parent.find(params[:parent_id])
		babysitter = Babysitter.find(params[:babysitter_id])
		render json: parent
	end  

end

