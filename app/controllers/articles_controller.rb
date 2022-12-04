class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # Here users search and save their search
  def search
    @articles = if params[:content_search].present?
                  Searches.new(params[:content_search], current_user.id).save_query
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
end
