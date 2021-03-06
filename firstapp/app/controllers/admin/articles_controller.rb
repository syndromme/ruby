class Admin::ArticlesController < Admin::ApplicationController
  before_filter :require_admin_login
  before_filter :find_article, :only => [:destroy, :show, :update, :edit, :show]
  
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to admin_articles_path
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
    redirect_to edit_admin_articles_path
    #else
    #  redirect_to articles_path
    #end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  private
    def find_article
      @article=Article.find_by_id(params[:id])
      if @article.nil?
        flash[:error] = "Can't find article with id = '#{params{:id}}'"
        redirect_to admin_articles_path
      end
    end
end
