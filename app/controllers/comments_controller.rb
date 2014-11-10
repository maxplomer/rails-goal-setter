class CommentsController < ApplicationController

  def new
  end

  def create
    @comment =
  end



  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
