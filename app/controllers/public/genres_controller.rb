class Public::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新しいジャンルを作成しました！"
      redirect_to new_word_path
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
