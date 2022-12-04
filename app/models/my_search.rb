class MySearch < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { maximum: 500, minimum: 3 }
  scope :saved_search, -> { select(:body).distinct }
end
