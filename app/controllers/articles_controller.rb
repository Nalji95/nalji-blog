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

end