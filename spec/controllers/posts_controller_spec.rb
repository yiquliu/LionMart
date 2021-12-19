require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    Post.create(:title => "Halloween Costume", :post_by => "Adam Green",
                 :price => 21, :description => "costume")
    Post.create(:title => "Used Monitor", :post_by => "Owen Brooks",
                :price => 21, :description => "An used monitor. 27 inch and 2k resolution. Fair.")
  end

  describe "create" do
    it "creates a post with details" do
      if User.where(:user_name => "Janice Wills").empty?
        User.create({:user_name => "Janice Wills", :google_id => 123321, :email => "jw@columbia.edu"})
      end
      cookies.signed[:user_id] = (User.find_by_user_name("Janice Wills")).id
      get :create, params: {:post => {:title => "Halloween Costume", :post_by => "Adam Green",
                               :price => 21, :description => "costume"}}
      expect(response).to redirect_to posts_path
      expect(flash[:notice]).to match(/Halloween Costume was successfully created./)
      Post.find_by(:title => "Halloween Costume").destroy
    end
  end

  describe "show" do
    it "shows a specific movie" do
      post = Post.find_by(:title => "Halloween Costume")
      get :show, params: { :id => post.id }
      expect(assigns(:post)).to eq(Post.find(post.id))
    end
  end

  describe "index" do
    it "shows all movies" do
      get :index
      expect(assigns(:posts)).to eq(Post.all.reverse())
    end
  end

  describe "edit" do
    it "edits a movie" do
      post = Post.find_by(:title => "Halloween Costume")
      get :edit, params: { :id => post.id }
      expect(assigns(:post)).to eq(Post.find(post.id))
    end
  end

  describe "updates" do
    it "movie's valid attributes" do
      post = Post.create(:title => "Used Monitor", :post_by => "Owen Brooks",
                         :price => 21, :description => "")
      get :update, params: {:id => post.id, :post =>
        {:description => "An used monitor. 27 inch and 2k resolution. Fair."}
      }

      expect(response).to redirect_to post_path(post)
      expect(flash[:notice]).to match(/Used Monitor was successfully updated./)
      post.destroy
    end
  end

  describe "destroy" do
    it "deletes a movie from list" do
      post = Post.create(:title => "Used Monitor", :post_by => "Owen Brooks",
        :price => 21, :description => "")
      delete :destroy, params: {:id => post.id}

      expect(response).to redirect_to posts_path
      expect(flash[:notice]).to match("Post 'Used Monitor' deleted.")
    end
  end

  describe "userPosts" do
    it "shows the posts of a specific user" do
      post = Post.create(:title => "Used Monitor", :post_by => "Owen Brooks",
                         :price => 21, :description => "")
      get :userPosts, params: {:user_name => "Owen Brooks"}

      expect(assigns(:posts)).to eq(Post.where(:post_by => "Owen Brooks"))

    end
  end
end

