class ArticlesController < ApplicationController
  before_action :params_article, only: [:show, :update, :destroy, :edit]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def show

  end

  def create
    @article = Article.new(permission)
    @article.save
    redirect_to articles_path
  end

  def update
    @article.update(permission)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def params_article
    @article = Article.find(params[:id])

  end

  def permission
    params.require(:article).permit(:title, :content)
  end
end
