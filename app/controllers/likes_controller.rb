class LikesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :destroy]

  def new
    @like = Like.new
    @like.user = current_user
    @like.comment_id = params[:comment_id]

    if @like.save
      @comment = Comment.find(params[:comment_id])
      respond_to do |format|
        format.js { render 'button' }
      end
    end
  end

  def destroy
    @like = Like.where(user_id: current_user.id, comment_id: params[:comment_id]).first
    if @like.destroy
      @comment = Comment.find(params[:comment_id])
      respond_to do |format|
        format.js { render 'button' }
      end
    end
  end
end
