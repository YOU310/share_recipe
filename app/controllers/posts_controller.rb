class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update]
  before_action :guest_check, only: %i[new create edit update]
  PER_PAGE = 12

  def index
    @q = Post.includes(:user, :likes).ransack(params[:q])
    @posts = @q.result.genre_classification(params[:genre]).page(params[:page]).per(PER_PAGE)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "レシピを投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
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
