class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to article_path(@comment.article_id)
    else
      flash.now[:error] = "Could not save comment"
    end
  end
end
