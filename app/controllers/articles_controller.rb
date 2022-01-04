class ArticlesController < ApplicationController

  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #byebug
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain:@article.inspect
    if @article.save
        flash[:notice]= "Article was successfully created"
      redirect_to articles_path(@article)# without shortcut --> dirct to table 
      #redirect_to @article ## with shortcut --> direct to index
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice]= "Article was successfully updated"
      redirect_to articles_path(@article)# without shortcut
    else
      render 'edit'
    end
  end

end