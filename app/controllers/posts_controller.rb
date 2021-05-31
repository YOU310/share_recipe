class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to action: :index
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :material, :recipe, :video, :image)
  end
end
