class Api::V1::UsersController < ApplicationController
  before_action :find_user, except: %i[index]

  def index
    @users = User.all.order(:id)
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  private

  def find_user
    @user = User.find_by_id!(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User not found' }, status: :not_found
  end
end
