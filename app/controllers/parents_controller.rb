class ParentsController < ApplicationController 

	def index 
		render json: Parent.all, includes:['babysitters','requests','bookings'] 
	end 

	def show
		parent = Parent.find(params[:id])
		render json: parent
	end 

end
