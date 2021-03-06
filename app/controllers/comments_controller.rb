class CommentsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new()
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
