class Searches
  def initialize(query, user_id)
      @query = query
      @user_id = user_id
  end

  def save
      recent_search = MySearch.first
      if recent_search && is_equal(recent_search.query.downcase, @query.downcase)
          recent_search.query = @query
          if recent_search.query == @query
              recent_search.updated_at = DateTime.now
          end
          recent_search.save!
          return recent_search
      end

      MySearch.create! body: @query, user_id: @user_id
  end

  private
      def is_equal(query1, query2)
          return query_score(query1, query2) > SIMILARITY_THRESHOLD
      end

      def query_score(query1, query2)
          score = 0
          index_black_list = []
          query1.each_char.with_index do |c, i|
              if index_black_list.length == query2.length
                  break
              end

              i2 = find_index query2, query1[i], index_black_list
              if not i2
                  next 
              end

              index_black_list.append i2

              dist = 2 ** -(i - i2).abs
              if dist >= 0.01
                  score += dist
              end
          end

          length = if query1.length < query2.length then query1.length else query2.length end
          score.to_f / length
      end

      def find_index(str, target, index_black_list = [])
          skip = 0
          loop do
              i = str[skip..-1].index target
              if not i
                  return nil 
              end

              i += skip
              if not index_black_list.include? i
                  return i
              end

              skip = i + 1
              if skip >= str.length
                  return nil 
              end
          end
      end
end