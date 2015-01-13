class PostsController < ApplicationController
  
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new

  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/'
    else
      flash[:notice] = "Sorry! We couldn't save that"
      redirect_to '/'
    end
  end

  def post_params
    params.require(:post).permit(:name, :image)
  end

  def show
    @post = Post.find(params[:id])
    userId = @post.user_id
    @user = User.find(userId)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to '/'
  end

end
