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
    params.require(:post).permit(:name, :image)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to '/'
  end

end
