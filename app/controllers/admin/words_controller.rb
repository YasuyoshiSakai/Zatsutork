class Admin::WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    # レコードの削除処理

    redirect_to admin_words_path
    # 削除後に一覧表示にリダイレクト
  end

  def show
    @word = Word.find(params[:id])
    # Wordモデルから該当するデータを取得してビューに渡す
  end

  def edit
    @word = Word.find(params[:id])
    # Wordモデルから該当するデータを取得してビューに渡す
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      # 更新が成功した場合の処理
    else
      # 更新が失敗した場合の処理
    end
  end
end