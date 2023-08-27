class Public::HomesController < ApplicationController
  def top
    @recent_words = Word.order(created_at: :desc).limit(5)
    @recent_genres = Genre.order(created_at: :desc).limit(5)
  end

  def about
  end
end
