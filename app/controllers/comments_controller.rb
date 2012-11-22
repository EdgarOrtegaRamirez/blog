class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    if @comment.save
      UserMailer.comment(@comment).deliver
      redirect_to post_path(@post), :notice => "Your comment was submitted. Thank you"
    else
      redirect_to post_path(@post), :error => "Your comment couldn't be submitted"
    end
  end
end
