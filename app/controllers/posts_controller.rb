class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comments = @post.comments.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    @post.user = current_user

    if @post.save
      redirect_to posts_path, :notice => "Your post was created succesfully"
    else
      flash[:error] = "There were some errors creating your post"
      render action: "new"
    end    
  end
end
