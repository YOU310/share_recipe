class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @commnet = Comment.new
  end

  def create
    binding.pry
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to action: "index"
    else
      redirect_to action: "index", alert: "ERROR!"
    end
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
    params.permit(:title, :content, :image, { post_ids: [] })
  end
end
