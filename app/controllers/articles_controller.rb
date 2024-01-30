class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def show; end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated succesfully.'
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was deleted succesfully.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
