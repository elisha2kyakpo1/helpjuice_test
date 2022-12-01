class MySearch < ApplicationRecord
  belongs_to :user
  has_many :search_results, dependent: :destroy
  has_many :articles, through: :search_results
  validates :body, presence: true
  before_save :set_final_search
  before_save :set_searched

  private

  def set_final_search
    self.articles = Article.search_by_content(body)
  end

  def set_time_frame
    @time_range = 5.weeks.ago.beginning_of_week(:sunday)..Time.now
  end

  def set_searched
    @limit = 500
    @searches = My_search.connection.select_all(My_Search.select('normalized_query, COUNT(*) as searches_count, AVG(results_count) as avg_results_count').where(created_at: @time_range).group('normalized_query')
    .order('searches_count desc, normalized_query asc').limit(@limit).to_sql).to_a
  end
end
