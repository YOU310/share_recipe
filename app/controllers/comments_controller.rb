class CommentsController < ApplicationController
  before_action :set_post, only: %i[edit update]
  before_action :guest_check, only: %i[new create edit update]

  PER_PAGE = 10

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(id: :DESC).page(params[:page]).per(PER_PAGE)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    current_user.comments.create!(comment_params)
    redirect_to post_comments_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    Comment.find(params[:id]).update!(comment_params)
    redirect_to comments_path
  end

  def destroy
    Comment.find(params[:id]).destroy!
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :image).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @post.nil?
  end

  def guest_check
    redirect_to root_path, alert: "ゲストログインでは、レシピの閲覧のみ可能です" if current_user.email == "guest@example.com"
  end
end
