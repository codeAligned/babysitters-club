class Api::V1::UsersController < ApplicationController

  def index
		users = User.all
		render json: users
	end

  def create
    byebug
    user = User.create(user_params)
    # parent = Parent.create(parents_params)
    if user_type_params[:user_type]=='parent'
      username = Parent.create({user_id: user.id})
    else
      username = Babysitter.create({user_id: user.id})
    end
    render json: username
  end








  private

   def user_params
     params.require(:user).permit(:name, :email, :username, :password)
    #  {"user"=>{"name"=>"Clark Sacktor", "email"=>"csacktor@oberlin.edu", "username"=>"csacktor", "password"=>"123", "user_type"=>""}
   end

   def user_type_params
     params.require(:user).permit(:user_type)
   end
end
