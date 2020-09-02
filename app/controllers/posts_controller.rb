class PostsController < ApplicationController
  def index
    @post = Post.first
    render json: {posts: @post}
  end
end
