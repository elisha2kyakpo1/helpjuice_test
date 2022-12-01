class Searches
  def initialize(query, result, user_id)
    Search.create(
      query:,
      results_count: result,
      user: user_id
    )
  end
end
