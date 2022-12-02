class ArticlesController < ApplicationController
  def index
    @query = params[:content_search]
    Searches.new(@query, current_user.id).save_query if !@query.nil? && !@query.empty?
    @articles = Article.all
  end

  def search
    @articles = if params[:content_search].present?
                  Article.search_item(params[:content_search])
                else
                  []
                end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_results',
                                                 partial: 'articles/search_results', locals: { articles: @articles })
      end
    end
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
