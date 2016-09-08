class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: auth_params[:email])
    if user != nil
      if user.authenticate(auth_params[:password])
        jwt = Auth.issue({user: user.id})
        if user.type=='Parent'
          render json: RenderParentUser.login(jwt, user)
        else
          render json: RenderBabysitterUser.login(jwt, user)
        end
      else
        render json: {error: "unauthorized"}, status: 404
      end
    else
      render json: {error: "user does not exist"}, status: 404
    end
  end

  def show
    user = User.find(retrieve_params[:id])
    if user != nil
      if user.type=='Parent'
        render json: RenderParentUser.viewable_user(user)
      else
        render json: RenderBabysitterUser.viewable_user(user)
        
      end
    else
      render json: {error: "user does not exist"}, status: 404
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end

  def retrieve_params
    params.require(:auth).permit(:id)
  end
end
