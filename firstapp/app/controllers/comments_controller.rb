class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comments = Comment.where("article_id=#{@comment.article_id}")#Article.find_by_id(@comment.article_id)
    #@article.user=current_user
    #@article.user_id=current_user.id
  #  if @comment.save
  #    redirect_to article_path(@comment.article_id)
  #  else
  #    flash.now[:error] = "Could not save comment"
  #  end
  #end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(article_path(@comment.article_id), :notice => 'Comment was successfully created.') }
        format.js
      #else
      #  flash.now[:error] = "Could not save comment"
      end
    end
  end
end
