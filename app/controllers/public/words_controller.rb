class Public::WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

def create
  if customer_signed_in?
    @word = current_customer.words.new(word_params)
    if @word.save
      flash[:notice] = "投稿が完了しました！投稿ありがとうございます♪"
      redirect_to complete_path
    else
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
  end

  def complete
  end

  private

  def word_params
    params.require(:word).permit(:content)
  end
end
