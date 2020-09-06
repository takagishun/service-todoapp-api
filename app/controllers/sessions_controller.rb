class SessionsController < ApplicationController
  def create
    user = User.find_by(user_id: strong_params[:userId])
    if user && user.authenticate(strong_params[:password])
      session[:user_id] = user.user_id
      render json: {message: 'ok', user: user}, status: :ok
    else
      render json: { message: '認証エラー' }, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    render json: {message: 'ok'}, status: :ok
  end

  def strong_params
    params.permit(:userId, :password)
  end
end
