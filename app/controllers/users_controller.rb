class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
      flash.now[:create_success] = "Account '#{@user.username}' created! you are now logged in."
    else
      render :new
      #add error message
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
