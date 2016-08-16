class Api::V1::SessionsController < ApplicationController
  # skip_before_action :login_required, only: [:new, :create]

  # def new
  #   @user = User.new
  # end

  def create
    user = User.find_by(user_name: user_name_param)
    if user != nil
      if user.authenticate(password_param)
        session[:user_id] = user.id
        # send message saying authenticated, maybe send session back?
        # user.id
        # redirect_to profile_path(session[:user_id])
      else
        # send message saying authentication failed, password's wrong
        # flash.now[:invalidpass] = 'Incorrect password'
        # render 'new'
      end
    else
      # user doesn't exist
      # flash.now[:invaliduser] = 'User does not exist'
      # render 'new'
    end
  end

  # on longout
  def destroy
    session[:user_id] = nil
    # send message saying you've logged out
    # redirect_to root_path
  end

  private

  # fix this
  def user_name_param
    params.require(:user).permit(:user_name)[:user_name]
  end

  # fix this
  def password_param
    params.require(:user).permit(:password)[:password]
  end
end
