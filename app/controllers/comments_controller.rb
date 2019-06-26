class CommentsController < ApplicationController

  def index
    @comments = Comment.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end
  
  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.create(title: comment_params[:title], message: comment_params[:message], user_id: current_user.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :message)
  end

end
