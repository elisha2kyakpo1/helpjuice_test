class ArticlesController < ApplicationController
  def index
    @query = params[:content_search]
    if @query.nil?
    @articles = Article.all
    end
  end

  def search
    if params[:content_search].present?
      @articles = Article.search_item(params[:content_search])
    else
      @articles = []
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("search_results",
                                partial: "articles/search_results", locals: { articles: @articles })
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
