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
    Comment.create!(comment_params)
    redirect_to comment_path
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
    params.require(:comment).permit(:title, :content, :image)
  end
end
