class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update]
  before_action :guest_check, only: %i[new create edit update]
  PER_PAGE = 12

  def index
    @posts = Post.genre_classification(params[:genre]).page(params[:page]).per(PER_PAGE)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to posts_path, notice: "レシピを投稿しました"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update!(post_params)
    redirect_to posts_path, notice: "レシピを更新しました"
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :material, :recipe, :video, :image, :genre)
  end

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @post.nil?
  end

  def guest_check
    redirect_to root_path, alert: "ゲストログインでは、レシピの閲覧のみ可能です" if current_user.email == "guest@example.com"
  end
end
