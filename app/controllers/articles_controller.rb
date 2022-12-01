class ArticlesController < ApplicationController
  def index
    @results = Article.search_data(params[:q])
    Searches.new(params[:q], @results.count, request.current_user.id)
  end

  def autocomplete
    render json: Article.search(params[:query], {
                                fields: ['title^5', 'content'],
                                match: :word_start,
                                limit: 10,
                                load: false,
                                misspellings: { below: 5 }
                              }).map(&:title)
  end
end
