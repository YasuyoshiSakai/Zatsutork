class Like < ApplicationRecord
  belongs_to :customer
  belongs_to :word

  validates :customer_id, presence: true
  validates :word_id, presence: true
end