class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    # params[:id]
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
