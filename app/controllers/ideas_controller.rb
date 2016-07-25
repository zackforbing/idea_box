class IdeasController < ApplicationController
  # before_action :set_user, only: [:new, :create]

  def new
    @user = User.find(session[:user_id])
    @idea = @user.ideas.new
  end

  def create
    @user = User.find(session[:user_id])
    @idea = @user.ideas.create(idea_params)

    redirect_to user_idea_path(@idea)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end

    def set_user
          @user = User.find(session[:user_id])
    end
end
