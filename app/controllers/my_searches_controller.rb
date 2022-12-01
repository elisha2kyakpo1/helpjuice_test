class MySearchesController < ApplicationController
  def most_recent
    @top_searches = @searches.first(5)
  end

  def recent_searches
    @searched = My_search.order('created_at desc').limit(50)
  end

  def clear_searches
    My_search.destroy_all
  end
end
