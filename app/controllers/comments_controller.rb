class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    if user_signed_in?
      @comment = UserComment.new(params[:comment])
      @comment.user = current_user
    else
      @comment = Comment.new(params[:comment])
    end
    @comment.post = @post

    if @comment.save
      UserMailer.comment(@comment).deliver
      redirect_to post_path(@post), :notice => "Your comment was submitted. Thank you"
    else
      redirect_to post_path(@post), :error => "Your comment couldn't be submitted"
    end
  end
end
