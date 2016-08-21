class Api::V1::BookingsController < ApplicationController

  def create
    bookingrequest = BookingRequest.find(booking_requests_params[:id])
    request = BookingRequest.accept(bookingrequest)
    render json: request
  end


private

	 def booking_requests_params
		 params.require(:bookings).permit(:id)
	 end

  #  def booking_params
  #    params.require(:bookings).permit(Booking.create({parent_id: booking.parent_id, babysitter_id: booking.babysitter_id, desired_time: booking.desired_time, duration: booking.duration, desired_date: booking.desired_date})
  #  end

end
