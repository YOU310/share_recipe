class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    Post.create!(post_params)
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
