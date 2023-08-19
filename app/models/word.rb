class Word < ApplicationRecord
  belongs_to :customer
  has_many :likes, dependent: :destroy
  belongs_to :genre
  has_many :word_genres
  has_many :genres, through: :word_genres

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  def self.top_viewed(limit)
    order(views_count: :desc).limit(limit)
  end

  validates :content, presence: true, length: { maximum: 100 }
end
