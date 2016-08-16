

class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: auth_params[:email])
    if user != nil
      if user.authenticate(auth_params[:password])
        jwt = Auth.issue({user: user.id})
        render json: {jwt: jwt}
      else
        render json: {error: "unauthorized"}, status: 404
      end
    else
      render json: {error: "user does not exist"}, status: 404
    end
  end


  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
