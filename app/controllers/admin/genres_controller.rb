class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルを追加しました。"
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンルを更新しました。"
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end