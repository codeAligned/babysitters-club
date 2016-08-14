class ReviewsController < ApplicationController
  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def create
    review = Review.create({parent_babysitter_id: params[:parent_babysitter_id].to_i, title: params[:title], description: params[:description], rating: params[:rating].to_i})
    		# parent = Parent.create(parents_params)
    render json: review
  end

  def update
		review = Review.find(params[:parent_babysitter_id])
		babysitter.update({parent_babysitter_id: params[:parent_babysitter_id].to_i, title: params[:title], description: params[:description], rating: params[:rating].to_i})
		# (babysitter_params) don't forget patch!
		render json: review
	end


private

  	 def reviews_params
  		 params.require(:reviews).permit(:parent_babysitter_id, :title, :description, :rating)
  	 end

end
