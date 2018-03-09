class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @result = []
    else
      @result = Article.search(params[:q]).paginate(page: 1, per_page: 10)
    end
  end

end
