class MySearch < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :saved_search, -> { select(:body).disticnt }
end
