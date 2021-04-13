class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      @post = @comment.post
      @comments = @post.comments
      render "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
