class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :update, :edit]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
  end

  def new
    @post = Post.new
  end
  
  def edit
	@post = Post.find(params[:id])
  end
  
  def update
	@post = Post.find(params[:id])
	
	if @post.update_attributes(params[:post])
		flash[:notice] = 'Your post was edited succesfully'
		redirect_to action: 'show', id: @post
	else
		flash[:error] = "There were some errors editing your post"
		render action: 'edit'
	end
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
