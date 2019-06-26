class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order("created_at DESC").page(params[:page]).per(10)
  end
  
  def new
    @comments = Comment.new
  end

  def create
    @commnets = Comment.new(comment_params)
    @commnets.save
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :message)
  end

end
