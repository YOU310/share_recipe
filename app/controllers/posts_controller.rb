class PostsController < ApplicationController
  PER_PAGE = 12

  def index
    @posts = Post.genre_classification(params[:genre]).page(params[:page]).per(PER_PAGE)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :material, :recipe, :video, :image, :genre)
  end
end
