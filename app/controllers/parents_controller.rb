class ParentsController < ApplicationController 

	def index 
		if params[:search]
			parents = Parent.search(params[:search])
		else
			parents = Parent.all
		end
		render json: parents, includes:['babysitters','requests','bookings'] 
	end 

	def show
		parent = Parent.find(params[:id])
		render json: parent
	end  

end

