class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy]

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
    # @genre is set by before_action
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンルを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_path, notice: "ジャンルを削除しました。"
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
