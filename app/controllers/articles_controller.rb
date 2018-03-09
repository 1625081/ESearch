class ArticlesController < ApplicationController
  def new
  end

  def show
   @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

   @article.save
   redirect_to @article
  end

  def index
     @articles = Article.all
     if params[:q].nil?
       @result = []
     else
       @result = Article.search(params[:q]).paginate(:page => params[:page], :per_page => 5)
     end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
