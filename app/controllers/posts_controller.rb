class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :DESC)
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
    params.require(:post).permit(:title, :material, :recipe, :video, :image)
  end
end
