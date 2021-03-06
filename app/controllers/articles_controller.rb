class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
    # byebug
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(articles_params)
    #render plain:@article.inspect
    if @article.save
      flash[:notice]= "Article was successfully created"
      #redirect_to articles_path(@article)# without shortcut --> dirct to table 
      #redirect_to article_path(@article) ## without shortcut --> direct to index
      redirect_to @article ## with shortcut --> direct to index
    else
      render 'new'
    end
  end

  def update
    if @article.update(articles_params)
      flash[:notice]= "Article was successfully updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :description)
  end


end