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

  def destroy
  end

end
