class Article < ApplicationRecord
  searchkick word_start: %i[title content]

  def search_data
    if params[:q].present?
      @articles = Article.search params[:q]
    else
      @articles = Article.all
    end
  end
end
