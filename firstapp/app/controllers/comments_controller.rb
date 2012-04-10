class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comments])
    if @comment.save
      #redirect_to articles_path#, :id => @article.id
    else
      flash.now[:error] = "Could not save comment"
      #@article = Article.find(:all)
      #render :action => "new"
    end
  end

  #def create
  # @article = Article.find(params[:id])
  # @comment = @article.comments.create!params[:comment]
  # redirect_to @article, :notice => "Comment Created"
  #end
end
