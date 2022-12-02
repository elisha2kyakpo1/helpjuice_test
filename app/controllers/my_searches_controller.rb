class MySearchesController < ApplicationController
  def index
    @top_searches = MySearch.saved_search
  end

  def recent_searches
    @searched = MySearch.order('created_at desc').limit(50)
  end

  def clear_searches
    My_search.destroy_all
  end
end
