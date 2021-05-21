class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    Post.crete!(post_params)
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:title, :material, :recipe, :video, :image)
  end
end
