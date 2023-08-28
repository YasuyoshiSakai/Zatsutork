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
<<<<<<< HEAD
      # 更新が成功した場合の処理
    else
      # 更新が失敗した場合の処理
    end
  end
=======
      flash[:notice] = "Wordを更新しました。"
      redirect_to admin_word_path(@word)
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end


  private

  def word_params
    params.require(:word).permit(:title, :content) # 必要な属性を適宜追加
  end
>>>>>>> develop
end