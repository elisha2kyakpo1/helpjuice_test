class Searches
  def initialize(query, user_id)
    @query = query
    @user_id = user_id
  end

  def save_query
    recent_search = MySearch.first
    if recent_search && equal(recent_search.query.downcase, @query.downcase)
      recent_search.query = @query
      recent_search.updated_at = DateTime.now if recent_search.query == @query
      recent_search.save!
      return recent_search
    end

    MySearch.create! body: @query, user_id: @user_id
  end

  private

  def equal(first_query, second_query)
    query_count(first_query, second_query) > 0.5
  end

  def query_count(first_query, second_query)
    count = 0
    unwanted_index = []
    first_query.each_char.with_index do |_c, i|
      break if unwanted_index.length == second_query.length

      query2_value = find_index second_query, first_query[i], unwanted_index
      next unless query2_value

      unwanted_index.append query2_value

      dist = 2**-(i - query2_value).abs
      count += dist if dist >= 0.01
    end

    length = first_query.length < second_query.length ? first_query.length : second_query.length
    count.to_f / length
  end

  def find_index(str, target, unwanted_index = [])
    next_ = 0
    loop do
      i = str[next_..].index target
      return nil unless i

      i += next_
      return i unless unwanted_index.include? i

      next_ = i + 1
      return nil if next_ >= str.length
    end
  end
end
