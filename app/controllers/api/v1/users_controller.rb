class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  
  def index
		users = User.all
		render json: users
	end

  def create
    user = User.create(user_params)
    byebug
    # parent = Parent.create(parents_params)
    if user_type_params[:user_type]=='PARENT'
      account = Parent.create({user_id: user.id})
    else
      account = Babysitter.create({user_id: user.id})
    end
    render json: account
  end

  def update
    byebug
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
    # {"user"=>{"name"=>"Clark Sacktor", "email"=>"csacktor@oberlin.edu", "username"=>"csacktor", "password"=>"123", "user_type"=>""}
  end

  def user_type_params
    params.require(:user).permit(:user_type)
  end

end
