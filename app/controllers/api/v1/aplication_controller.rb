class Api::V1::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_action :authenticate_with_token

  respond_to :json
# def update_allowed_parameters
#     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
#     devise_parameter_sanitizer.permit(:account_update) do |u|
#       u.permit(:name, :email, :photo, :bio, :password, :current_password)
#     end
#   end

#   private
  # def authenticate_with_token
  #   if params[:api_token]
  #     user = User.find_by_api_token(params[:api_token])
  #     sign_in(user)
  #   end
  # end
end
