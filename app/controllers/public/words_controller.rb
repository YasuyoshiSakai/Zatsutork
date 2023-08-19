class Public::WordsController < ApplicationController
  def index
    @words = Word.all
    @words = current_customer.words
  end

  def new
    @word = Word.new
  end

def create
  if customer_signed_in?
    @word = current_customer.words.new(word_params)
    @genre = Genre.find_by(id: word_params[:genre_id])
    if @word.save
      flash[:notice] = "投稿が完了しました！投稿ありがとうございます♪"
      redirect_to complete_path
    else
      puts @word.errors.full_messages
      render :new
    end
  else
    # ログインしていない場合の処理
    flash[:alert] = "ログインが必要です"
    redirect_to new_customer_session_path # ログインページへのリダイレクトなど
  end
end

  def show
    @word = Word.find(params[:id])
    @word.increment!(:views_count) # 閲覧数をインクリメント
    @likes = @word.likes
  end

  def need_login
  end

  def random
    @random_word = Word.order("RANDOM()").first
  end

  def view_ranking
    @top_viewed_words = Word.top_viewed(10) # 上位10件を取得する
  end

  private

def word_params
  params.require(:word).permit(:title, :content, :genre_id) # :genre_id を追加
end
end