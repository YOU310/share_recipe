class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.likes.create!(post_id: params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.likes.find_by(post_id: params[:post_id]).destroy!
  end
end
