class ArticlesController < ApplicationController
  before_filter :find_article, :only => [:destroy, :show, :update]
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_path#, :id => @article.id
    else
      flash.now[:error] = "Could not save article"
      #@article = Article.find(:all)
      render :action => "new"
    end
  end

  def edit
    find_article
  end

  def show
    find_article
    @comments = @article.comments
  end

  def update
    #@articles = Article.find(params[:id])
    find_article
    if @article.update_attributes(params[:article])
      redirect_to articles_path
    else
      render :action => "edit"
    end
  end

  def destroy
    find_article
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private
    def find_article
      @article=Article.find_by_id(params[:id])
      if @article.nil?
        flash[:error] = "Can't find article with id = '#{params{:id}}'"
        redirect_to articles_path
      end
    end
end
