class ParentsController < ApplicationController


	def create

		parent = Parent.create(name: params[:name], email: params[:email])
		# parent = Parent.create(parents_params)
		render json: parent
	end

	def index
		render json: Parent.all, includes:['babysitters','requests','bookings', 'booking_requests']
	end

	def show
		parent = Parent.find(params[:id])
		render json: parent
	end

	def update
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
