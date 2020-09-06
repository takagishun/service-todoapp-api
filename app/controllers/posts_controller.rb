class PostsController < ApplicationController
  def index
    if current_user
      posts = current_user.posts.order(created_at: 'DESC')
      render json: {data: posts}
    else
      render json: {message: '認証エラー'}, status: :unauthorized
    end
  end

  def create
    if current_user
      post = current_user.posts.build(title: params[:title], detail: params[:detail], status: 1)
      if post.valid?
        post.save
        render json: {message: 'ok'}
      else
        render json: {message: '追加失敗'}
      end
    else
      render json: {message: '認証エラー'}, status: :unauthorized
    end
  end

  def destroy
    if current_user
      post = current_user.posts.find_by(id: params[:id])
      if post
        post.destroy
        render json: {message: 'ok'}
      end
    else
      render json: {message: '認証エラー'}, status: :unauthorized
    end
  end

  def current_user
    User.find_by(user_id: session[:user_id])
  end
end
