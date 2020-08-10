class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save 
      redirect_to @post, notice: "留言成功"
    else
      redirect_to @post, notice: "留言失敗"
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end