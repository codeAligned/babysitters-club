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

    request = BookingRequest.create(booking_requests_params)
    render json: request
  end

  def destroy
    request = BookingRequest.find(params[:id])
    request.delete
  end


private

	 def booking_requests_params
		 params.require(:bookings).permit(:parent_id, :babysitter_id, :duration, :desired_time, :desired_date)
	 end


end
