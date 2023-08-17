class Word < ApplicationRecord
  belongs_to :customer
  validates :content, presence: true, length: { maximum: 100 }
end
