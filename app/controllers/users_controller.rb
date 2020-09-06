class UsersController < ApplicationController
  def create
    user = User.new(user_id: params[:userId], password: params[:password])
    if user.valid?
      user.save
      render json: { message: 'ok' }
    else
      render json: { message: 'サインアップに失敗しました', details: user.errors.details }, status: :bad_request
    end
  end
end
