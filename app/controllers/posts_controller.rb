class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new

  end

  def create
    Post.create(post_params)
    redirect_to '/'
  end

  def post_params
    params.require(:post).permit(:name)
  end

end
