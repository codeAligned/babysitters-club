class Api::V1::ReviewsController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    review = Review.find(params[:id])
    render json: review
  end

  def create
    review = Review.create(review_params)
    review.parent_babysitter_id = 7
    review.save
    render json: review
  end

  def update
		review = Review.find(params[:id])
		babysitter.update({parent_babysitter_id: params[:parent_babysitter_id].to_i, title: params[:title], description: params[:description], rating: params[:rating].to_i})
		# (babysitter_params) don't forget patch!
		render json: review
	end

  def destroy
    review = Review.find(params[:id])
    review.delete
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
