class PostsController < ApplicationController
  def new
  end

  def index
    @posts = Post.all
  end

  def show
    id = params[:id]
    @post = Post.find(id)
  end
    
  def create
    attributes = post_params.clone
    attributes["post_by"] = (User.find cookies.signed[:user_id])["user_name"]
    @post = Post.create!(attributes)
    flash[:notice] = "#{@post.title} was successfully created."
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update!(post_params)
    flash[:notice] = "#{@post.title} was successfully updated."
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' deleted."
    redirect_to posts_path
  end
    
  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.  
  def post_params
    params.require(:post).permit(:title, :price, :description, :post_by)
  end

end
