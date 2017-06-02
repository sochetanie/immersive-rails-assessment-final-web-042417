class UsersController < ApplicationController
    before_action :check_status, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to 'episodes_path'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
