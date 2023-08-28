class WordComment < ApplicationRecord
  belongs_to :customer
  belongs_to :word

  validates :comment, presence: true
end
