class Api::V1::BookingsController < ApplicationController

  def create
    byebug
    request = BookingRequest.accept(booking_requests_params[:id])
    render json: request
  end


private

	 def booking_requests_params
		 params.require(:bookings).permit(:id)
	 end


end
