class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy, :show]
  before_filter :find_article, :only => [:destroy, :show, :update, :edit]
  before_filter :find_user, :only => [:update, :destroy, :edit, :show]

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_path
    else
      flash.now[:error] = "Could not save article"
      render :action => "new"
    end
  end

  def edit

  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end

  def update
    @article.update_attributes(params[:article])
    redirect_to edit_articles_path
    #else
    #  redirect_to articles_path
    #end
  end

  def destroy
    unless @user.id == nil
      @article.destroy
      redirect_to articles_path
    else
      render :text => "Not Permitted"
    end
  end

  private
    def find_article
      @article=Article.find_by_id(params[:id])
      if @article.nil?
        flash[:error] = "Can't find article with id = '#{params{:id}}'"
        redirect_to root_url
      end
    end

    def find_user
      @user=@article.user
      unless @user.id == current_user.id#session[:user_id]
        redirect_to root_url
      end
    end
end
