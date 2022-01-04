class ArticlesController < ApplicationController

 def show
   # byebug
  @article = Article.find(params[:id])
 end

 def index
  @articles = Article.all

 end

 def new
     
 end

 def create
  # pour voir se qui se passe apres avoir cliqué sur save article,
  #du moins pour voir les parametres prient en entrés
  render plain: params[:article]
 end
end