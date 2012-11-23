class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    if user_signed_in?
      @comment = UserComment.new(params[:comment])
      @comment.user = current_user
    else
      @comment = AnonymousComment.new(params[:comment])
    end
    @comment.post = @post

    if @comment.save
      UserMailer.comment(@comment).deliver
      flash[:notice] = "Your comment was published. Thank you"
    else
      flash[:error] = "Your comment wasn't published, Nickname can't be blank"
    end
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end
end
