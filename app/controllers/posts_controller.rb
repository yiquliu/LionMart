class PostsController < ApplicationController


  def new
  end

  def index
    @posts = Post.all.with_attached_avatar.reverse()
    if cookies.signed[:user_id].nil?
      @current_user = $current
      if @current_user.nil?
        @current_user = "test_user"
      end
    else
      @current_user = (User.find cookies.signed[:user_id])["user_name"]
    end
  end

  def show
    id = params[:id]
    if cookies.signed[:user_id].nil?
      @current_user = $current
      if @current_user.nil?
        @current_user = "test_user"
      end
    else
      @current_user = (User.find cookies.signed[:user_id])["user_name"]
    end
    @post = Post.find(id)
    if @post.post_by.nil? or User.find_by_user_name(@post.post_by).nil?
      @email = "test@columbia.edu"
    else
      @email = User.find_by_user_name(@post.post_by).email
    end
#     @email = User.find_by_user_name(@post.post_by).email
  end
    
  def create
    attributes = post_params.clone
    # print ('hi')
    if cookies.signed[:user_id].nil?
      attributes["post_by"] = "Ruby"
    else
      attributes["post_by"] = (User.find cookies.signed[:user_id])["user_name"]
      # attributes["email"] = ()
    end
    @post = Post.create!(attributes)

    @post.avatar.attach(params[:post][:image])

    flash[:notice] = "#{@post.title} was successfully created."
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update!(post_params)

    unless params[:post][:image].nil?
      @post.avatar.attach(params[:post][:image])
    end
    flash[:notice] = "#{@post.title} was successfully updated."
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' deleted."
    redirect_to posts_path
  end

  def userPosts
    @user_name = params[:user_name]
    @posts = Post.where(post_by: @user_name)
  end
    
  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.  
  def post_params
    params.require(:post).permit(:title, :price, :description, :post_by)
    #to do avatart!
  end

end
