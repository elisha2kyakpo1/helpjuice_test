class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_content, against: %i[title content]
  scope :filter_by_content, ->(content) { where('content ILIKE ?', "%#{content}%") }
end
