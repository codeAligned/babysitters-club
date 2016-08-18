class Api::V1::ParentsController < ApplicationController
	skip_before_action :authenticate, only: [:create, :index]

	def create

		parent = Parent.create(name: params[:name], email: params[:email])
		# parent = Parent.create(parents_params)
		render json: parent
	end

	def index
		byebug
		render json: Parent.all
	end

	def show
		parent = Parent.find(params[:id])
		render json: parent
	end

	def update
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
