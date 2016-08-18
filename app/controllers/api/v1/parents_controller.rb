class Api::V1::ParentsController < ApplicationController
	skip_before_action :authenticate, only: [:create]

	def index
		debugger
		render json: Parent.all
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


	 def parents_params
		 params.require(:user).permit(:address, :kid_count, :specific_needs, :extra_requests)
	 end



end
