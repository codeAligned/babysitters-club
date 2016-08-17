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
		parent.update(parents_params)
		render json: parent
	end

  def destroy
    parent = Parent.find(params[:id])
    parent.delete
  end

	private

<<<<<<< HEAD

	 def parents_params
		 params.require(:user).permit(:kid_count, :address, :specific_needs, :extra_requests)
	 end


=======
	def parents_params
		params.require(:parents).permit(:name, :email)
	end
>>>>>>> master

end
