class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @categories = @post.categories
    @comment = Comment.new 
    @user = User.new
    @comments = @post.comments
    @my_users = @post.users.uniq
    @users = User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    post.categories = post.categories.uniq
    post.save
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
