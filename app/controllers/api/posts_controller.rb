class Api::PostsController < ApplicationController
  before_action :authorize_request
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).includes(:comments)

    json_response(@posts)
  end
end

# Compare this snippet from app\controllers\api\v1\posts_controller.rb:
# post = Post.where(author_id: params[:user_id])
# if post
#   render json: @post, status: :ok
# else
#   render json: { message: 'No post found' }, status: :not_found
# end
