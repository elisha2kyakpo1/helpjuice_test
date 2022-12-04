class MySearchesController < ApplicationController
  def index
    # only the create of the search to see what they searched
    @top_searches = MySearch.saved_search.where(user: current_user)
  end

  def clear_searches
    My_search.destroy_all
  end
end
