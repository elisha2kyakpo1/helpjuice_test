class Article < ApplicationRecord
  scope :search_item, ->(search) { where('title ILIKE :keyword OR content ILIKE :keyword', keyword: "%#{search}%") }
end
