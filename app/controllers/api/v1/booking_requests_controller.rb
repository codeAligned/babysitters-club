class Api::V1::BookingRequestsController < ApplicationController
  def index
    requests = BookingRequest.all
    render json: requests
  end

  def show
    request = BookingRequest.find(params[:id])
    render json: request
  end

  def create
    byebug

    request = BookingRequest.create(id: params[:id])
#{parent_id: params[:parent_id].to_i, babysitter_id: params[:babysitter_id].to_i, duration: params[:duration].to_i}

        # parent = Parent.create(parents_params) #dont forget desired time
    render json: request
  end

  def destroy
    request = BookingRequest.find(params[:id])
    request.delete
  end

private

	 def booking_requests_params
		 params.require(:user).permit(:id, :babysitter_id, :duration, :desired_time)
	 end


end
