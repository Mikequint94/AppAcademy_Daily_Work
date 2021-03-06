class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    fail
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
