class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  scope :search_item, ->(title) { where('title ILIKE ?', "%#{title}%") }
end
