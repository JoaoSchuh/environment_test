class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: { allow_nil: true, greater_than_or_equal_to: 0}
  validates :published_date, presence: false
end
