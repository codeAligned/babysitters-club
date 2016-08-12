class BookingRequestsController < ApplicationController
  def index
    requests = BookingRequest.all
    render json: requests
  end

  def show
    request = BookingRequest.find(params[:id])
    render json: request
  end
end
