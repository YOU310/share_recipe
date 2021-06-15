class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      redirect_back(fallback_lovation: root_path)
    end
    # current_user.posts.create!(post_params)
    # redirect_to action: :index
  end

  def show
    @post = Post.find(params[:id])
    # postに関連付けてあるコメントを全て取得
    @comments = @post.comments
    # @comment = current_user.comments.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :material, :recipe, :video, :image)
  end
end
