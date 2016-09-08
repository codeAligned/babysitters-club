class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def index
		users = User.all
		render json: users
	end

  def create
    user = User.create(user_params)
    user.profile_pic = "/src/images/png/#{(Random.new.rand(10) + 1)}.png"
    if user_type_params[:user_type]=='PARENT'
      account = Parent.create({user_id: user.id})
    else
      account = Babysitter.create({user_id: user.id})
    end
    render json: account
  end

  def update
    user = User.find(params[:id])
    if user.type=='Parent'
      parent = Parent.find_by(user_id: params[:id])
      parent.update(edit_parent_params)
      render json: parent
    else
      babysitter = Babysitter.find_by(user_id: params[:id])
      babysitter.update(edit_babysitter_params)
      render json: babysitter
    end

  end

  def show
    user = User.find(viewable_user_id_params[:id])
    current_user = User.find(viewable_user_id_params[:current_user_id])
    if user.type=='Parent' && current_user.type=='Parent'
      render json: RenderParentUser.current_viewable_user(user, viewable_user_id_params[:current_user_id])
    elsif user.type=='Parent'
      render json: RenderBabysitterUser.current_viewable_user(user)
    else
      render json: RenderBabysitterUser.current_viewable_user_reviews(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
    # {"user"=>{"name"=>"Clark Sacktor", "email"=>"csacktor@oberlin.edu", "username"=>"csacktor", "password"=>"123", "user_type"=>""}
  end

  def user_type_params
    params.require(:user).permit(:user_type)
  end

  def viewable_user_id_params
    params.require(:user).permit(:id, :current_user_id)
  end

  def edit_parent_params
    params.require(:user).permit(:address, :kid_count, :specific_needs, :extra_requests)
  end

  def edit_babysitter_params
	 	params.require(:user).permit(:age, :location, :bio, :skills)
 	end

end
