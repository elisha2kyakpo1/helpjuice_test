class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  scope :search_item, ->(search) { where('title ILIKE :keyword OR content ILIKE :keyword', keyword: "%#{search}%") }
end
